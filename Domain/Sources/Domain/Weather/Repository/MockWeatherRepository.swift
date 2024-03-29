//
//  MockWeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public final class MockWeatherRepository: WeatherRepository {
    
    public var _getCurrentWeather: (
        _ location: LocationQuery,
        _ airQualityIncluded: Bool
    ) async throws -> Weather = { _, _ in
        .mock(location: .default())
    }
    
    public var _getDayForecast: (
        _ location: LocationQuery,
        _ days: Int,
        _ airQualityIncluded: Bool,
        _ weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast = { _, _, _, _ in
        .mock()
    }
    
    public var _getHourForecast: (
        _ location: LocationQuery,
        _ days: Int,
        _ airQualityIncluded: Bool,
        _ weatherAlertsIncluded: Bool
    ) async throws -> MultiHourForecast = { _, _, _, _ in
        .mock()
    }
    
    public var _getLocations: (
        _ search: String
    ) async throws -> SearchLocationResults = { _ in
        .mock()
    }
    
    public init() { }
    
    public func getCurrentWeather(
        for location: LocationQuery,
        airQualityIncluded: Bool
    ) async throws -> Weather {
        try await _getCurrentWeather(location, airQualityIncluded)
    }
    
    public func getDayForecast(
        for location: LocationQuery,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast {
        try await _getDayForecast(location, days, airQualityIncluded, weatherAlertsIncluded)
    }
    
    public func getHourForecast(
        for location: LocationQuery,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiHourForecast {
        try await _getHourForecast(location, days, airQualityIncluded, weatherAlertsIncluded)
    }
    
    public func getLocations(
        for search: String
    ) async throws -> SearchLocationResults {
        try await _getLocations(search)
    }
}
