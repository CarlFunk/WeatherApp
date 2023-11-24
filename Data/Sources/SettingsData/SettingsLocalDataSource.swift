//
//  SettingsLocalDataSource.swift
//  SettingsData
//
//  Created by Carl Funk on 10/21/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public protocol SettingsLocalDataSource {
    func fetchWeatherSettings() async throws -> WeatherSettingsResponse
    func fetchHomeLocation() async throws -> HomeLocationResponse
    
    func updateWeatherSettings(_ request: WeatherSettingsUpdateRequest) async throws
    func updateHomeLocation(_ location: String) async throws
}
