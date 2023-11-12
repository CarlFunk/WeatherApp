//
//  ForecastInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/23/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct ForecastInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
    
    public let forecastDays: [ForecastDayInnerResponseModel]
}
