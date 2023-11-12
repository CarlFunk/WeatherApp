//
//  HourWeatherInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/25/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct HourWeatherInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case condition
        case temperatureCelcius = "temp_c"
        case temperatureFahrenheit = "temp_f"
        case time
        case timeEpoch = "time_epoch"
    }
    
    public let condition: ConditionInnerResponseModel
    
    /// Temperature in celsius
    public let temperatureCelcius: Double
    
    /// Temperature in fahrenheit
    public let temperatureFahrenheit: Double
    
    public let time: String
    
    public let timeEpoch: Int
}
