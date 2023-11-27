//
//  WeatherApiRequestBuilder.swift
//  WeatherData
//
//  Created by Carl Funk on 2/25/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

final class WeatherApiRequestBuilder {
    enum BuilderError: Error {
        case invalidBaseURL
        case invalidEndpointURL
        case invalidEndpointURLRequest
    }
    
    enum Endpoint {
        case astronomy(query: String, date: String?)
        case current(query: String, airQualityIncluded: Bool)
        case forecast(query: String, days: Int, airQualityIncluded: Bool, weatherAlertsIncluded: Bool)
        case search(query: String)
        
        var path: String {
            switch self {
            case .astronomy:    return "v1/astronomy.json"
            case .current:      return "v1/current.json"
            case .forecast:     return "v1/forecast.json"
            case .search:       return "v1/search.json"
            }
        }
    }
    
    private enum QueryItem {
        case key(String)
        case query(String)
        case days(Int)
        case airQualityIncluded(Bool)
        case weatherAlertsIncluded(Bool)
        case date(String?)
        
        private var name: String {
            switch self {
            case .key:                      return "key"
            case .query:                    return "q"
            case .days:                     return "days"
            case .airQualityIncluded:       return "aqi"
            case .weatherAlertsIncluded:    return "alerts"
            case .date:                     return "dt"
            }
        }
        
        private var value: String {
            switch self {
            case .key(let value):                   return value
            case .query(let value):                 return value
            case .days(let value):                  return String(value)
            case .airQualityIncluded(let value):    return value ? "yes" : "no"
            case .weatherAlertsIncluded(let value): return value ? "yes" : "no"
            case .date(let value):                  return value ?? ""
            }
        }
        
        var urlQueryItem: URLQueryItem {
            return URLQueryItem(name: name, value: value)
        }
    }
    
    private let baseURLString = "https://api.weatherapi.com/"
    private let apiKey: String
    
    init(apiKey: String) {
        if apiKey.isEmpty {
            fatalError("WeatherAPI key was not provided")
        }
        
        self.apiKey = apiKey
    }
    
    func request(for endpoint: Endpoint) throws -> URLRequest {
        guard let baseURL = URL(string: baseURLString) else {
            throw BuilderError.invalidBaseURL
        }
        
        let endpointURL = baseURL.appendingPathComponent(endpoint.path)
        guard var endpointComponents = URLComponents(url: endpointURL, resolvingAgainstBaseURL: false) else {
            throw BuilderError.invalidEndpointURL
        }
        
        endpointComponents.queryItems = requestQueryItems(for: endpoint)
        
        guard let requestURL = endpointComponents.url else {
            throw BuilderError.invalidEndpointURLRequest
        }
        
        return URLRequest(
            url: requestURL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: TimeInterval(10))
    }
    
    private func requestQueryItems(for endpoint: Endpoint) -> [URLQueryItem] {
        var queryItems = [
            QueryItem.key(apiKey)
        ]
        
        switch endpoint {
        case .astronomy(let query, let date):
            queryItems.append(contentsOf: [
                QueryItem.query(query),
                QueryItem.date(date)
            ])
        case .current(let query, let airQualityIncluded):
            queryItems.append(contentsOf: [
                QueryItem.query(query),
                QueryItem.airQualityIncluded(airQualityIncluded)
            ])
        case .forecast(let query, let days, let airQualityIncluded, let weatherAlertsIncluded):
            queryItems.append(contentsOf: [
                QueryItem.query(query),
                QueryItem.days(days),
                QueryItem.airQualityIncluded(airQualityIncluded),
                QueryItem.weatherAlertsIncluded(weatherAlertsIncluded)
            ])
        case .search(let query):
            queryItems.append(contentsOf: [
                QueryItem.query(query)
            ])
        }
        
        return queryItems.map { $0.urlQueryItem }
    }
}
