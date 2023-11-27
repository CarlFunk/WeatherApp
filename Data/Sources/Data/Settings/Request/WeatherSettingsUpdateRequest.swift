//
//  WeatherSettingsUpdateRequest.swift
//  SettingsData
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public struct WeatherSettingsUpdateRequest {
    public let pressureUnitAbbreviation: String
    public let temperatureUnitAbbreviation: String
    public let windSpeedUnitAbbreviation: String
    
    public init(
        pressureUnitAbbreviation: String,
        temperatureUnitAbbreviation: String,
        windSpeedUnitAbbreviation: String
    ) {
        self.pressureUnitAbbreviation = pressureUnitAbbreviation
        self.temperatureUnitAbbreviation = temperatureUnitAbbreviation
        self.windSpeedUnitAbbreviation = windSpeedUnitAbbreviation
    }
}
