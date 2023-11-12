//
//  GetSettingSelectionOptionsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 10/19/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation
import SettingsDomain
import WeatherDomain

public final class GetSettingSelectionOptionsUseCase {
    public init() { }
    
    public func run(settings: Settings) async throws -> ([SettingsSelection: [SettingsSelectionOption]]) {
        
        let pressureOptions = PressureUnit.allCases.map {
            SettingsSelectionOption(
                id: $0.abbreviation,
                name: $0.name,
                isSelected: $0 == settings.pressureUnit)
        }
        
        let temperatureOptions = TemperatureUnit.allCases.map {
            SettingsSelectionOption(
                id: $0.abbreviation,
                name: $0.name,
                isSelected: $0 == settings.temperatureUnit)
        }
        
        let windSpeedOptions = WindSpeedUnit.allCases.map {
            SettingsSelectionOption(
                id: $0.abbreviation,
                name: $0.name,
                isSelected: $0 == settings.windSpeedUnit)
        }
        
        return [
            SettingsSelection.pressure: pressureOptions,
            SettingsSelection.temperature: temperatureOptions,
            SettingsSelection.windSpeed: windSpeedOptions
        ]
    }
}
