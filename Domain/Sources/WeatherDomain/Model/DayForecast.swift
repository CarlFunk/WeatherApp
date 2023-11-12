//
//  DayForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct DayForecast {
    public let id: String
    public let date: String
    public let highTemperature: Temperature
    public let lowTemperature: Temperature
    public let sunriseTime: String
    public let sunsetTime: String
    public let weatherCondition: WeatherCondition
    
    public init(
        id: String,
        date: String,
        highTemperature: Temperature,
        lowTemperature: Temperature,
        sunriseTime: String,
        sunsetTime: String,
        weatherCondition: WeatherCondition
    ) {
        self.id = id
        self.date = date
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.sunriseTime = sunriseTime
        self.sunsetTime = sunsetTime
        self.weatherCondition = weatherCondition
    }
    
    public func dayOfWeekFormatted() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self.date) else {
            return nil
        }

        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date).capitalized
    }
}

public extension DayForecast {
    static func mock(date: String = "2022-11-21") -> DayForecast {
        DayForecast(
            id: "Mock",
            date: date,
            highTemperature: Temperature(
                celcius: 12.1,
                fahrenheit: 53.8),
            lowTemperature: Temperature(
                celcius: 5.5,
                fahrenheit: 41.9),
            sunriseTime: "07:04 AM",
            sunsetTime: "05:24 PM",
            weatherCondition: WeatherCondition(
                kind: .partlyCloudy,
                text: "Partly cloudy"))
    }
}
