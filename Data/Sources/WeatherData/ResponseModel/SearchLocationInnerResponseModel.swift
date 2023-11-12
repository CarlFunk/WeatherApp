//
//  SearchLocationInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/25/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct SearchLocationInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case country
        case id
        case latitude = "lat"
        case longitude = "lon"
        case name
        case query = "url"
        case region
    }
    
    /// Location country
    public let country: String
    
    /// Id of the location
    public let id: Int
    
    /// Latitude in decimal degree
    public let latitude: Double
    
    /// Longitude in decimal degree
    public let longitude: Double
    
    /// Location name
    public let name: String
    
    /// Query to use if looking up the location via the API
    public let query: String
    
    /// Region or state of the location, if available
    public let region: String
}
