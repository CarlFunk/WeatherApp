//
//  DefaultWeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import WeatherData

public final class DefaultWeatherRepository: WeatherRepository {
    @Dependency(RemoteWeatherDataSource.self) private var remoteDataSource
    
    public init() { }
    
    public func getCurrentWeather(
        for location: String,
        airQualityIncluded: Bool
    ) async throws -> Weather {
        let responseModel = try await remoteDataSource.fetchCurrent(for: location, airQualityIncluded: airQualityIncluded)
        return Weather(from: responseModel)
    }
    
    public func getDayForecast(
        for location: String,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast {
        let responseModel = try await remoteDataSource.fetchForecast(for: location, days: days, airQualityIncluded: airQualityIncluded, weatherAlertsIncluded: weatherAlertsIncluded)
        return responseModel.forecast.forecastDays.map { DayForecast(from: $0) }
    }
    
    public func getHourForecast(
        for location: String,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> [HourForecast] {
        let responseModel = try await remoteDataSource.fetchForecast(for: location, days: days, airQualityIncluded: airQualityIncluded, weatherAlertsIncluded: weatherAlertsIncluded)
        
        return responseModel.forecast.forecastDays
            .flatMap { dayResponseModel in
                dayResponseModel.hour.map { hourResponseModel in
                    HourForecast(from: hourResponseModel)
                }
            }
    }
    
    public func getLocations(
        for search: String
    ) async throws -> [SearchLocation] {
        let responseModels = try await remoteDataSource.fetchSearchResults(for: search)
        
        return responseModels
            .map { locationResponseModel in
                SearchLocation(from: locationResponseModel)
            }
    }
}
