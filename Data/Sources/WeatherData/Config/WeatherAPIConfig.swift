//
//  WeatherAPIConfig.swift
//  WeatherData
//
//  Created by Carl Funk on 11/19/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

struct WeatherAPIConfig: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "API_KEY"
    }
    
    let apiKey: String
    
}
