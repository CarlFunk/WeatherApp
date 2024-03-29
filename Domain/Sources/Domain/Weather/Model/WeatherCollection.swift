//
//  WeatherCollection.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public typealias WeatherCollection = [Weather]

public extension WeatherCollection {
    static func mock() -> WeatherCollection {
        let locations = WeatherLocationCollection.mock()
        return locations.map { location in
            Weather.mock(location: location)
        }
    }
}
