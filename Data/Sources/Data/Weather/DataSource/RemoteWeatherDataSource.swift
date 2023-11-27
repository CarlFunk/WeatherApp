//
//  RemoteWeatherDataSource.swift
//  WeatherData
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public protocol RemoteWeatherDataSource {
    func fetchAstronomy(for query: String, date: String?) async throws -> AstronomyResponse
    func fetchCurrent(for query: String, airQualityIncluded: Bool) async throws -> CurrentWeatherResponse
    func fetchForecast(for query: String, days: Int, airQualityIncluded: Bool, weatherAlertsIncluded: Bool) async throws -> ForecastWeatherResponse
    func fetchSearchResults(for query: String) async throws -> SearchWeatherResponse
}
