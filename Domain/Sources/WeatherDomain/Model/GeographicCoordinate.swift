//
//  GeographicCoordinate.swift
//  WeatherDomain
//
//  Created by Carl Funk on 4/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import CoreLocation
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
    
    public var coreLocationCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}

public extension GeographicCoordinate {
    static func mock() -> GeographicCoordinate {
        GeographicCoordinate(
            latitude: 32.78,
            longitude: -96.8)
    }
}
