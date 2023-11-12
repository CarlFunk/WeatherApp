//
//  DayForecast+Mapping.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/21/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import WeatherData

extension DayForecast {
    init(from response: ForecastDayInnerResponseModel) {
        self.id = response.date
        self.date = response.date
        self.highTemperature = Temperature(
            celcius: response.day.maxTemperatureCelcius,
            fahrenheit: response.day.maxTemperatureFahrenheit)
        self.sunriseTime = response.astronomy.sunriseTime
        self.sunsetTime = response.astronomy.sunsetTime
        self.lowTemperature = Temperature(
            celcius: response.day.minTemperatureCelcius,
            fahrenheit: response.day.minTemperatureFahrenheit)
        self.weatherCondition = WeatherCondition(
            from: response.day.condition)
    }
}
