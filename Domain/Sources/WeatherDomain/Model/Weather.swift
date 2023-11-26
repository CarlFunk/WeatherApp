//
//  Weather.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct Weather: Equatable {
    public let location: WeatherLocation
    public let condition: WeatherCondition
    public let temperature: Temperature
    public let windSpeed: WindSpeed
    public let pressure: Pressure
    public let humidity: Humidity
    
    public init(
        location: WeatherLocation,
        condition: WeatherCondition,
        temperature: Temperature,
        windSpeed: WindSpeed,
        pressure: Pressure,
        humidity: Humidity
    ) {
        self.location = location
        self.condition = condition
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.pressure = pressure
        self.humidity = humidity
    }
    
    public var isMock: Bool {
        self == .mock()
    }
    
    public func updated(location: WeatherLocation? = nil) -> Weather {
        Weather(
            location: location ?? self.location,
            condition: condition,
            temperature: temperature,
            windSpeed: windSpeed,
            pressure: pressure,
            humidity: humidity)
    }
}

public extension Weather {
    static func mock(
        location: WeatherLocation = .mock(),
        condition: WeatherCondition = .mock(),
        temperature: Temperature = .mock(),
        windSpeed: WindSpeed = .mock(),
        pressure: Pressure = .mock(),
        humidity: Humidity = .mock()
    ) -> Weather {
        return Weather(
            location: location,
            condition: condition,
            temperature: temperature,
            windSpeed: windSpeed,
            pressure: pressure,
            humidity: humidity)
    }
}
