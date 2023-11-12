//
//  SearchLocation.swift
//  WeatherDomain
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct SearchLocation {
    public let id: Int
    public let location: WeatherLocation
    public let locationQuery: String
    
    public init(
        id: Int,
        location: WeatherLocation,
        locationQuery: String
    ) {
        self.id = id
        self.location = location
        self.locationQuery = locationQuery
    }
    
    public func updated(location: WeatherLocation? = nil) -> SearchLocation {
        SearchLocation(
            id: id,
            location: location ?? self.location,
            locationQuery: locationQuery)
    }
}

public extension SearchLocation {
    static func mock(name: String = "Dallas") -> SearchLocation {
        SearchLocation(
            id: (1000000...9999999).randomElement()!,
            location: WeatherLocation(
                id: "Mock",
                name: name,
                region: "Texas",
                country: "United States of America",
                coordinate: GeographicCoordinate(
                    latitude: 32.78,
                    longitude: -96.8),
                isFavorite: false,
                isPrimary: false),
            locationQuery: "dallas-texas-united-states-of-america")
    }
}
