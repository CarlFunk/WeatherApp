//
//  AstronomyResponse.swift
//  WeatherData
//
//  Created by Carl Funk on 2/25/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct AstronomyResponse: Codable {
    public let location: LocationInnerResponseModel
    public let astronomy: AstronomyResponseModel
}

public extension AstronomyResponse {
    public struct AstronomyResponseModel: Codable {
        enum CodingKeys: String, CodingKey {
            case astronomy = "astro"
        }
        
        public var astronomy: AstronomyInnerResponseModel
    }
}
