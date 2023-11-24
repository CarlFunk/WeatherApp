//
//  Settings+Mapping.swift
//  SettingsDomain
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import SettingsData
import WeatherDomain

extension Settings {
    init(from response: WeatherSettingsResponse) {
        let defaultSettings = Settings.default()
        
        self.pressureUnit = PressureUnit(abbreviation: response.pressureUnit) ?? defaultSettings.pressureUnit
        self.temperatureUnit = TemperatureUnit(abbreviation: response.temperatureUnit) ?? defaultSettings.temperatureUnit
        self.windSpeedUnit = WindSpeedUnit(abbreviation: response.windSpeedUnit) ?? defaultSettings.windSpeedUnit
    }
}
