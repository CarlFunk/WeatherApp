//
//  AstronomyInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/16/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct AstronomyInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case moonIlluminationPercentage = "moon_illumination"
        case moonPhase = "moon_phase"
        case moonriseTime = "moonrise"
        case moonsetTime = "moonset"
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
    }
    
    /// Moon illumination as %
    public let moonIlluminationPercentage: Int
    
    /// Moon phases, Values returned:
    ///
    /// New Moon
    /// Waxing Crescent
    /// First Quarter
    /// Waxing Gibbous
    /// Full Moon
    /// Waning Gibbous
    /// Last Quarter
    /// Waning Crescent
    ///
    public let moonPhase: String
    
    /// Moonrise time
    public let moonriseTime: String
    
    /// Moonset time
    public let moonsetTime: String
    
    /// Sunrise time
    public let sunriseTime: String
    
    /// Sunset time
    public let sunsetTime: String
}
