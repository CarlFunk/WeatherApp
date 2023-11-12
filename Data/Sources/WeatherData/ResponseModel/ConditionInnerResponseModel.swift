//
//  ConditionInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 2/18/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct ConditionInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case code
        case icon
        case text
    }
    
    /// Weather condition unique code
    public let code: Int
    
    /// Weather icon url
    public let icon: String
    
    /// Weather condition text
    public let text: String
}
