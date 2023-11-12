//
//  DayWeatherInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/25/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct DayWeatherInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case averageHumidityPercentage = "avghumidity"
        case averageTemperatureCelcius = "avgtemp_c"
        case averageTemperatureFahrenheit = "avgtemp_f"
        case averageVisibilityKilometers = "avgvis_km"
        case averageVisibilityMiles = "avgvis_miles"
        case chanceOfRainPercentage = "daily_chance_of_rain"
        case chanceOfSnowPercentage = "daily_chance_of_snow"
        case condition
        case isRainPossible = "daily_will_it_rain"
        case isSnowPossible = "daily_will_it_snow"
        case maxTemperatureCelcius = "maxtemp_c"
        case maxTemperatureFahrenheit = "maxtemp_f"
        case maxWindSpeedKilometersPerHour = "maxwind_kph"
        case maxWindSpeedMilesPerHour = "maxwind_mph"
        case minTemperatureCelcius = "mintemp_c"
        case minTemperatureFahrenheit = "mintemp_f"
        case totalPrecipitationMillimeters = "totalprecip_mm"
        case totalPrecipitationInches = "totalprecip_in"
        case uvIndex = "uv"
    }
    
    /// Average humidity as percentage
    public let averageHumidityPercentage: Int
    
    /// Average temperature in celsius for the day
    public let averageTemperatureCelcius: Double
    
    /// Average temperature in fahrenheit for the day
    public let averageTemperatureFahrenheit: Double
    
    /// Average visibility in kilometer
    public let averageVisibilityKilometers: Double
    
    /// Average visibility in miles
    public let averageVisibilityMiles: Double
    
    /// Chance of rain as percentage
    public let chanceOfRainPercentage: Int

    /// Chance of snow as percentage
    public let chanceOfSnowPercentage: Int
    
    public let condition: ConditionInnerResponseModel
    
    /// Will it will rain or not, 1 = Yes 0 = No
    public let isRainPossible: Int
    
    /// Will it snow or not, 1 = Yes 0 = No
    public let isSnowPossible: Int
    
    /// Maximum temperature in celsius for the day
    public let maxTemperatureCelcius: Double
    
    /// Maximum temperature in fahrenheit for the day
    public let maxTemperatureFahrenheit: Double
    
    /// Maximum wind speed in kilometer per hour
    public let maxWindSpeedKilometersPerHour: Double
    
    /// Maximum wind speed in miles per hour
    public let maxWindSpeedMilesPerHour: Double
    
    /// Minimum temperature in celsius for the day
    public let minTemperatureCelcius: Double
    
    /// Minimum temperature in fahrenheit for the day
    public let minTemperatureFahrenheit: Double
    
    /// Total precipitation in milimeter
    public let totalPrecipitationMillimeters: Double
    
    /// Total precipitation in inches
    public let totalPrecipitationInches: Double
    
    /// UV Index
    public let uvIndex: Double
}
