//
//  ForecastWeatherResponse.swift
//  WeatherData
//
//  Created by Carl Funk on 2/16/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct ForecastWeatherResponse: Codable {
    public let current: CurrentInnerResponseModel
    public let forecast: ForecastInnerResponseModel
    public let location: LocationInnerResponseModel
}
