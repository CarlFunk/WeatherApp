//
//  HourForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct HourForecast: Equatable, Identifiable {
    public let date: Date
    public let temperature: Temperature
    public let weatherCondition: WeatherCondition
    
    public init(
        date: Date,
        temperature: Temperature,
        weatherCondition: WeatherCondition
    ) {
        self.date = date
        self.temperature = temperature
        self.weatherCondition = weatherCondition
    }
    
    public func hourFormatted() -> String {
        date.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated)))
    }
    
    public var id: String {
        date.formatted(.iso8601)
    }
}

public extension HourForecast {
    static func mock(
        date: Date = .mock(addedHours: 0),
        temperature: Temperature = .mock(),
        weatherCondition: WeatherCondition = .mock()
    ) -> HourForecast {
        HourForecast(
            date: date,
            temperature: temperature,
            weatherCondition: weatherCondition)
    }
}
