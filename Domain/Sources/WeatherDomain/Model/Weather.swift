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
    static func mock(name: String = "Dallas") -> Weather {
        Weather(
            location: WeatherLocation(
                id: "Mock",
                name: name,
                region: "Texas",
                country: "United States of America",
                coordinate: GeographicCoordinate(
                    latitude: 32.78,
                    longitude: -96.8),
                isFavorite: false,
                isPrimary: false),
            condition: WeatherCondition(
                kind: .partlyCloudy,
                text: "Partly cloudy"),
            temperature: Temperature(
                celcius: 8.3,
                fahrenheit: 46.9),
            windSpeed: WindSpeed(
                kilometersPerHour: 9.0,
                milesPerHour: 5.6),
            pressure: Pressure(
                inch: 30.36,
                millibar: 1028.0),
            humidity: Humidity(
                value: 71))
    }
}
