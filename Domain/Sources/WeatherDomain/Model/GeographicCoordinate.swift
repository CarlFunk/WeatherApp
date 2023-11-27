//
//  GeographicCoordinate.swift
//  WeatherDomain
//
//  Created by Carl Funk on 4/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct GeographicCoordinate: Equatable {
    public let latitude: Double
    public let longitude: Double
    
    public init(
        latitude: Double,
        longitude: Double
    ) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public var description: String {
        return "\(latitude),\(longitude)"
    }
}

public extension GeographicCoordinate {
    static func mock(
        latitude: Double = 32.78,
        longitude: Double = -96.8
    ) -> GeographicCoordinate {
        GeographicCoordinate(
            latitude: latitude,
            longitude: longitude)
    }
}
