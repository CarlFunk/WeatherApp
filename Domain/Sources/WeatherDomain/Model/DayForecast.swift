//
//  DayForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct DayForecast: Equatable, Identifiable {
    public let date: Date
    public let highTemperature: Temperature
    public let lowTemperature: Temperature
    public let sunriseTime: String
    public let sunsetTime: String
    public let weatherCondition: WeatherCondition
    
    public init(
        date: Date,
        highTemperature: Temperature,
        lowTemperature: Temperature,
        sunriseTime: String,
        sunsetTime: String,
        weatherCondition: WeatherCondition
    ) {
        self.date = date
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.sunriseTime = sunriseTime
        self.sunsetTime = sunsetTime
        self.weatherCondition = weatherCondition
    }
    
    public func dayOfWeekFormatted() -> String {
        date.formatted(.dateTime.weekday(.wide)).capitalized
    }
    
    public var id: String {
        date.formatted(.iso8601)
    }
}

public extension DayForecast {
    static func mock(
        date: Date = .mock(addedDays: 0),
        highTemperature: Temperature = .mock(),
        lowTemperature: Temperature = .mock(),
        sunriseTime: String = "07:04 AM",
        sunsetTime: String = "05:24 PM",
        weatherCondition: WeatherCondition = .mock()
    ) -> DayForecast {
        DayForecast(
            date: date,
            highTemperature: highTemperature,
            lowTemperature: lowTemperature,
            sunriseTime: sunriseTime,
            sunsetTime: sunsetTime,
            weatherCondition: weatherCondition)
    }
}
