//
//  CurrentInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/16/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct CurrentInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case cloudCoverPercentage = "cloud"
        case condition
        case feelsLikeTemperatureCelcius = "feelslike_c"
        case feelsLikeTemperatureFahrenheit = "feelslike_f"
        case humidityPercentage = "humidity"
        case isDay = "is_day"
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdatedTimestamp = "last_updated"
        case precipitationInches = "precip_in"
        case precipitationMillimeters = "precip_mm"
        case pressureInches = "pressure_in"
        case pressureMillibars = "pressure_mb"
        case temperatureCelcius = "temp_c"
        case temperatureFahrenheit = "temp_f"
        case uvIndex = "uv"
        case visibilityKilometers = "vis_km"
        case visibilityMiles = "vis_miles"
        case windDegree = "wind_degree"
        case windDirection = "wind_dir"
        case windGustKilometersPerHour = "gust_kph"
        case windGustMilesPerHour = "gust_mph"
        case windSpeedKilometersPerHour = "wind_kph"
        case windSpeedMilesPerHour = "wind_mph"
    }
    
    /// Cloud cover as percentage
    public let cloudCoverPercentage: Int
    
    public let condition: ConditionInnerResponseModel
    
    /// Feels like temperature in celsius
    public let feelsLikeTemperatureCelcius: Double
    
    /// Feels like temperature in fahrenheit
    public let feelsLikeTemperatureFahrenheit: Double
    
    /// Humidity as percentage
    public let humidityPercentage: Int
    
    /// Whether to show day condition icon or night icon 1 = Yes 0 = No
    public let isDay: Int
    
    /// Local time when the real time data was updated in unix time.
    public let lastUpdatedEpoch: Int
    
    /// Local time when the real time data was updated.
    public let lastUpdatedTimestamp: String
    
    /// Precipitation amount in inches
    public let precipitationInches: Double
    
    /// Precipitation amount in millimeters
    public let precipitationMillimeters: Double
    
    /// Pressure in inches
    public let pressureInches: Double
    
    /// Pressure in millibars
    public let pressureMillibars: Double
    
    /// Temperature in celsius
    public let temperatureCelcius: Double
    
    /// Temperature in fahrenheit
    public let temperatureFahrenheit: Double
    
    /// UV Index
    public let uvIndex: Double
    
    /// Visibility in kilometers
    public let visibilityKilometers: Double
    
    /// Visibility in miles
    public let visibilityMiles: Double
    
    /// Wind direction in degrees
    public let windDegree: Int
    
    /// Wind direction as 16 point compass. e.g.: NSW
    public let windDirection: String
    
    /// Wind gust in kilometer per hour
    public let windGustKilometersPerHour: Double
    
    /// Wind gust in miles per hour
    public let windGustMilesPerHour: Double
    
    /// Wind speed in kilometer per hour
    public let windSpeedKilometersPerHour: Double
    
    /// Wind speed in miles per hour
    public let windSpeedMilesPerHour: Double
}
