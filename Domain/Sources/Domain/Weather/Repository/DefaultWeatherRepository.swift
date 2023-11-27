//
//  DefaultWeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Data
import Dependency

public final class DefaultWeatherRepository: WeatherRepository {
    @Dependency(FavoriteLocalDataSource.self) private var favoriteLocalDataSource
    @Dependency(RemoteWeatherDataSource.self) private var remoteDataSource
    @Dependency(SettingsLocalDataSource.self) private var settingsLocalDataSource
    
    public init() { }
    
    public func getCurrentWeather(
        for location: LocationQuery,
        airQualityIncluded: Bool
    ) async throws -> Weather {
        let weatherResponse = try await remoteDataSource.fetchCurrent(for: location.value, airQualityIncluded: airQualityIncluded)
        let favoriteLocationsResponse = try await favoriteLocalDataSource.fetchLocations()
        let homeLocationResponse = try await settingsLocalDataSource.fetchHomeLocation()
        
        return Weather(
            weatherResponse: weatherResponse,
            favoriteLocationsResponse: favoriteLocationsResponse,
            homeLocationResponse: homeLocationResponse)
    }
    
    public func getDayForecast(
        for location: LocationQuery,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiDayForecast {
        let responseModel = try await remoteDataSource.fetchForecast(for: location.value, days: days, airQualityIncluded: airQualityIncluded, weatherAlertsIncluded: weatherAlertsIncluded)
        return responseModel.forecast.forecastDays.map { DayForecast(from: $0) }
    }
    
    public func getHourForecast(
        for location: LocationQuery,
        days: Int,
        airQualityIncluded: Bool,
        weatherAlertsIncluded: Bool
    ) async throws -> MultiHourForecast {
        let responseModel = try await remoteDataSource.fetchForecast(for: location.value, days: days, airQualityIncluded: airQualityIncluded, weatherAlertsIncluded: weatherAlertsIncluded)
        
        return responseModel.forecast.forecastDays
            .flatMap { dayResponseModel in
                dayResponseModel.hour.map { hourResponseModel in
                    HourForecast(from: hourResponseModel)
                }
            }
    }
    
    public func getLocations(
        for search: String
    ) async throws -> SearchLocationResults {
        let searchWeatherResponse = try await remoteDataSource.fetchSearchResults(for: search)
        let favoriteLocationsResponse = try await favoriteLocalDataSource.fetchLocations()
        let homeLocationResponse = try await settingsLocalDataSource.fetchHomeLocation()
        
        return SearchLocationResults(
            searchWeatherResponse: searchWeatherResponse,
            favoriteLocationsResponse: favoriteLocationsResponse,
            homeLocationResponse: homeLocationResponse)
    }
}
