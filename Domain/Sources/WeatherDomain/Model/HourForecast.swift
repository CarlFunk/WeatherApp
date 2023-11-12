//
//  HourForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct HourForecast {
    public let date: String
    public let temperature: Temperature
    public let weatherCondition: WeatherCondition
    
    public init(
        date: String,
        temperature: Temperature,
        weatherCondition: WeatherCondition
    ) {
        self.date = date
        self.temperature = temperature
        self.weatherCondition = weatherCondition
    }
    
    public func timeFormatted(includeMinutes: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: self.date) else {
            return ""
        }
        
        dateFormatter.dateFormat = includeMinutes ? "h:mm a" : "h a"
        return dateFormatter.string(from: date)
    }
}

public extension HourForecast {
    static func mock() -> HourForecast {
        HourForecast(
            date: "2022-11-21 00:00",
            temperature: Temperature(
                celcius: 6.9,
                fahrenheit: 44.4),
            weatherCondition: WeatherCondition(
                kind: .partlyCloudy,
                text: "Partly cloudy"))
    }
}
