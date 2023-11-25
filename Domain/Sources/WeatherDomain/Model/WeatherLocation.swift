//
//  WeatherLocation.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import CoreLocation
import Foundation

public struct WeatherLocation: Equatable {
    public let id: String
    public let name: String
    public let region: String
    public let country: String
    public let query: LocationQuery
    public let coordinate: GeographicCoordinate
    public let isFavorite: Bool
    public let isPrimary: Bool
    
    public init(
        id: String,
        name: String,
        region: String,
        country: String,
        query: LocationQuery,
        coordinate: GeographicCoordinate,
        isFavorite: Bool,
        isPrimary: Bool
    ) {
        self.id = id
        self.name = name
        self.region = region
        self.country = country
        self.query = query
        self.coordinate = coordinate
        self.isFavorite = isFavorite
        self.isPrimary = isPrimary
    }
    
    public func updated(isFavorite: Bool? = nil, isPrimary: Bool? = nil) -> WeatherLocation {
        WeatherLocation(
            id: id,
            name: name,
            region: region,
            country: country,
            query: query,
            coordinate: coordinate,
            isFavorite: isFavorite ?? self.isFavorite,
            isPrimary: isPrimary ?? self.isPrimary)
    }
}

public extension WeatherLocation {
    static func standard() -> WeatherLocation {
        WeatherLocation(
            id: "San Francisco",
            name: "San Francisco",
            region: "California",
            country: "United States of America",
            query: .standard(),
            coordinate: GeographicCoordinate(
                latitude: 37.78,
                longitude: -122.42),
            isFavorite: false,
            isPrimary: true)
    }
    
    static func mock() -> WeatherLocation {
        WeatherLocation(
            id: "Mock",
            name: "Dallas",
            region: "Texas",
            country: "United States of America",
            query: "dallas-texas-united-states-of-america",
            coordinate: GeographicCoordinate(
                latitude: 32.78,
                longitude: -96.8),
            isFavorite: false,
            isPrimary: false)
    }
}
