//
//  LocationInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/16/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct LocationInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case country
        case latitude = "lat"
        case localTimeEpoch = "localtime_epoch"
        case localTimestamp = "localtime"
        case longitude = "lon"
        case name
        case region
        case timeZoneName = "tz_id"
        
    }
    
    /// Location country
    public let country: String
    
    /// Latitude in decimal degree
    public let latitude: Double
    
    /// Local date and time in unix time
    public let localTimeEpoch: Int
    
    /// Local date and time
    public let localTimestamp: String
    
    /// Longitude in decimal degree
    public let longitude: Double
    
    /// Location name
    public let name: String
    
    /// Region or state of the location, if available
    public let region: String
    
    /// Time zone name
    public let timeZoneName: String
}
