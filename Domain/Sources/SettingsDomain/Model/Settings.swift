//
//  Settings.swift
//  SettingsDomain
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import WeatherDomain

public struct Settings: Equatable, Identifiable {
    public let id: String
    public let pressureUnit: PressureUnit
    public let temperatureUnit: TemperatureUnit
    public let windSpeedUnit: WindSpeedUnit
    
    public init(
        id: String = UUID().uuidString,
        pressureUnit: PressureUnit,
        temperatureUnit: TemperatureUnit,
        windSpeedUnit: WindSpeedUnit
    ) {
        self.id = id
        self.pressureUnit = pressureUnit
        self.temperatureUnit = temperatureUnit
        self.windSpeedUnit = windSpeedUnit
    }
    
    public var isMock: Bool {
        self == .mock()
    }
    
    public func updated(properties: [PartialKeyPath<Settings>: Any]) -> Settings {
        Settings(
            pressureUnit: properties[\.pressureUnit] as? PressureUnit ?? pressureUnit,
            temperatureUnit: properties[\.temperatureUnit] as? TemperatureUnit ?? temperatureUnit,
            windSpeedUnit: properties[\.windSpeedUnit] as? WindSpeedUnit ?? windSpeedUnit)
    }
}

public extension Settings {
    static func `default`() -> Settings {
        Settings(
            id: "Default",
            pressureUnit: .millibar,
            temperatureUnit: .fahrenheit,
            windSpeedUnit: .milesPerHour)
    }
    
    static func mock(id: String = "Mock") -> Settings {
        Settings(
            id: id,
            pressureUnit: .mock(),
            temperatureUnit: .mock(),
            windSpeedUnit: .mock())
    }
}
