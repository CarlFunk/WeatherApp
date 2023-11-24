//
//  WeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public protocol WeatherRepository {
    func getCurrentWeather(
        for location: String,
        airQualityIncluded: Bool
    ) async throws -> Weather
    
    func getDayForecast(
        for location: String,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast
    
    func getHourForecast(
        for location: String,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> [HourForecast]
    
    func getLocations(
        for search: String
    ) async throws -> SearchLocationResults
}
