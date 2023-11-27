//
//  CurrentWeatherResponse.swift
//  WeatherData
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct CurrentWeatherResponse: Codable {
    public let current: CurrentInnerResponseModel
    public let location: LocationInnerResponseModel
}
