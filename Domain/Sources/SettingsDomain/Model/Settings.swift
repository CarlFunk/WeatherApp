//
//  Settings.swift
//  SettingsDomain
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import WeatherDomain

public struct Settings {
    public let pressureUnit: PressureUnit
    public let temperatureUnit: TemperatureUnit
    public let windSpeedUnit: WindSpeedUnit
    
    public init(
        pressureUnit: PressureUnit,
        temperatureUnit: TemperatureUnit,
        windSpeedUnit: WindSpeedUnit
    ) {
        self.pressureUnit = pressureUnit
        self.temperatureUnit = temperatureUnit
        self.windSpeedUnit = windSpeedUnit
    }
}

public extension Settings {
    static func mock() -> Settings {
        Settings(
            pressureUnit: .mock(),
            temperatureUnit: .mock(),
            windSpeedUnit: .mock())
    }
}
