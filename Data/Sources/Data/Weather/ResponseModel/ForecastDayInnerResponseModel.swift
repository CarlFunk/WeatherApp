//
//  ForecastDayInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/23/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct ForecastDayInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case astronomy = "astro"
        case date
        case dateEpoch = "date_epoch"
        case day
        case hour
    }
    
    public let astronomy: AstronomyInnerResponseModel
    
    /// Forecast date
    public let date: String
    
    /// Forecast date as unix time
    public let dateEpoch: Int
    
    public let day: DayWeatherInnerResponseModel
    
    public let hour: [HourWeatherInnerResponseModel]
}
