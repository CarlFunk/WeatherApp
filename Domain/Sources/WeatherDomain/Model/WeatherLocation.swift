//
//  WeatherLocation.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import CoreLocation
import Foundation

public struct WeatherLocation: Equatable, Identifiable {
    public let name: String
    public let region: String
    public let country: String
    public let query: LocationQuery
    public let coordinate: GeographicCoordinate
    public let isFavorite: Bool
    public let isPrimary: Bool
    
    public init(
        name: String,
        region: String,
        country: String,
        query: LocationQuery,
        coordinate: GeographicCoordinate,
        isFavorite: Bool,
        isPrimary: Bool
    ) {
        self.name = name
        self.region = region
        self.country = country
        self.query = query
        self.coordinate = coordinate
        self.isFavorite = isFavorite
        self.isPrimary = isPrimary
    }
    
    public var id: String {
        query.value
    }
    
    public func updated(isFavorite: Bool? = nil, isPrimary: Bool? = nil) -> WeatherLocation {
        WeatherLocation(
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
    static func `default`() -> WeatherLocation {
        WeatherLocation(
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
    
    static func mock(
        name: String = "Name",
        region: String = "Region",
        country: String = "Country",
        coordinate: GeographicCoordinate = .mock(),
        isFavorite: Bool = false,
        isPrimary: Bool = false
    ) -> WeatherLocation {
        WeatherLocation(
            name: name,
            region: region,
            country: country,
            query: LocationQuery.generate(
                name: name,
                region: region,
                country: country),
            coordinate: coordinate,
            isFavorite: isFavorite,
            isPrimary: isPrimary)
    }
}
