//
//  LocationQueryCollection.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/26/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public typealias LocationQueryCollection = [LocationQuery]

public extension LocationQueryCollection {
    static func mock() -> LocationQueryCollection {
        let locations = WeatherLocationCollection.mock()
        return locations.map { location in
            location.query
        }
    }
}
