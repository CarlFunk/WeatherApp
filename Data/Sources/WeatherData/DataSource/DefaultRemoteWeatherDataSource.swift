//
//  DefaultRemoteWeatherDataSource.swift
//  WeatherData
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public final class DefaultRemoteWeatherDataSource: RemoteWeatherDataSource {
    public enum DataSourceError: Error {
        case invalidForecastDays
    }
    
    private let requestBuilder: WeatherApiRequestBuilder
    private let urlSession: URLSession
    
    public init() {
        guard
            let path = Bundle.main.path(forResource: "WeatherAPIConfig", ofType: "plist"),
            let data = FileManager.default.contents(atPath: path),
            let config = try? PropertyListDecoder().decode(WeatherAPIConfig.self, from: data)
        else {
            fatalError("WeatherAPIKey.plist not found or corrupted.")
        }
        
        requestBuilder = WeatherApiRequestBuilder(apiKey: config.apiKey)
        urlSession = URLSession.shared
    }
    
    public func fetchAstronomy(for query: String, date: String?) async throws -> AstronomyResponse {
        try validateQueryParameter(query)
        try validateDateParameter(date)
        
        let request = try requestBuilder.request(
            for: .astronomy(
                query: query,
                date: date))
        let (data, _) = try await urlSession.data(for: request, delegate: nil)
        let responseModel = try JSONDecoder().decode(AstronomyResponse.self, from: data)
        return responseModel
    }
    
    public func fetchCurrent(for query: String, airQualityIncluded: Bool) async throws -> CurrentWeatherResponse {
        try validateQueryParameter(query)
        
        let request = try requestBuilder.request(
            for: .current(
                query: query,
                airQualityIncluded: false))
        let (data, _) = try await urlSession.data(for: request, delegate: nil)
        let responseModel = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
        return responseModel
    }
    
    public func fetchForecast(for query: String, days: Int, airQualityIncluded: Bool, weatherAlertsIncluded: Bool) async throws -> ForecastWeatherResponse {
        try validateQueryParameter(query)
        try validateDaysParameter(days)
        
        let request = try requestBuilder.request(
            for: .forecast(
                query: query,
                days: days,
                airQualityIncluded: airQualityIncluded,
                weatherAlertsIncluded: weatherAlertsIncluded))
        let (data, _) = try await urlSession.data(for: request, delegate: nil)
        let responseModel = try JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
        return responseModel
    }
    
    public func fetchSearchResults(for query: String) async throws -> SearchWeatherResponse {
        try validateQueryParameter(query)
        
        let request = try requestBuilder.request(
            for: .search(
                query: query))
        let (data, _) = try await urlSession.data(for: request, delegate: nil)
        let responseModel = try JSONDecoder().decode(SearchWeatherResponse.self, from: data)
        return responseModel
    }
    
    private func validateQueryParameter(_ query: String) throws {
        
    }
    
    private func validateDaysParameter(_ days: Int) throws {
        guard (1...10).contains(days) else {
            throw DataSourceError.invalidForecastDays
        }
    }
    
    private func validateDateParameter(_ date: String?) throws {
        
    }
}
