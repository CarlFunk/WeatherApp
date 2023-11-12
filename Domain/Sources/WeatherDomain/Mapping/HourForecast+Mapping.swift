//
//  HourForecast+Mapping.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/21/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import WeatherData

extension HourForecast {
    init(from response: HourWeatherInnerResponseModel) {
        self.date = response.time
        self.temperature = Temperature(
            celcius: response.temperatureCelcius,
            fahrenheit: response.temperatureFahrenheit)
        self.weatherCondition = WeatherCondition(
            from: response.condition)
    }
}
