//
//  MockSettingsLocalDataSource.swift
//  SettingsData
//
//  Created by Carl Funk on 11/2/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public final class MockSettingsLocalDataSource: SettingsLocalDataSource {
    public init() { }
    
    public func fetchWeatherSettings() async throws -> WeatherSettingsResponse {
        WeatherSettingsResponse(
            pressureUnit: "mbar",
            temperatureUnit: "F",
            windSpeedUnit: "mph")
    }
    
    public func fetchHomeLocation() async throws -> HomeLocationResponse { "" }
    
    public func updateWeatherSettings(_ request: WeatherSettingsUpdateRequest) async throws { }
    
    public func updateHomeLocation(_ location: String) async throws { }
}
