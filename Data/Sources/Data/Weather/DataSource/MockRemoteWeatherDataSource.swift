//
//  MockRemoteWeatherDataSource.swift
//  WeatherData
//
//  Created by Carl Funk on 11/2/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public final class MockRemoteWeatherDataSource: RemoteWeatherDataSource {
    public enum DataSourceError: Error {
        case placeholder
    }
    
    public init() { }
    
    public func fetchAstronomy(for query: String, date: String?) async throws -> AstronomyResponse {
        throw DataSourceError.placeholder
    }
    
    public func fetchCurrent(for query: String, airQualityIncluded: Bool) async throws -> CurrentWeatherResponse {
        throw DataSourceError.placeholder
    }
    
    public func fetchForecast(for query: String, days: Int, airQualityIncluded: Bool, weatherAlertsIncluded: Bool) async throws -> ForecastWeatherResponse {
        throw DataSourceError.placeholder
    }
    
    public func fetchSearchResults(for query: String) async throws -> SearchWeatherResponse {
        throw DataSourceError.placeholder
    }
}
