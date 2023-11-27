//
//  WeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public protocol WeatherRepository {
    func getCurrentWeather(
        for location: LocationQuery,
        airQualityIncluded: Bool
    ) async throws -> Weather
    
    func getDayForecast(
        for location: LocationQuery,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast
    
    func getHourForecast(
        for location: LocationQuery,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiHourForecast
    
    func getLocations(
        for search: String
    ) async throws -> SearchLocationResults
}
