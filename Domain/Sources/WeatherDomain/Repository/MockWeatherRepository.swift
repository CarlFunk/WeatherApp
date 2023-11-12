//
//  MockWeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import WeatherData

public final class MockWeatherRepository: WeatherRepository {
    
    public init() { }
    
    public func getCurrentWeather(
        for location: String,
        airQualityIncluded: Bool
    ) async throws -> Weather {
        return Weather.mock()
    }
    
    public func getDayForecast(
        for location: String,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast {
        return .mock()
    }
    
    public func getHourForecast(
        for location: String,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> [HourForecast] {
        return [
            HourForecast.mock()
        ]
    }
    
    public func getLocations(
        for search: String
    ) async throws -> [SearchLocation] {
        return [
            SearchLocation.mock()
        ]
    }
}
