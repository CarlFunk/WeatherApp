//
//  WeatherLocationCollection.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/26/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public typealias WeatherLocationCollection = [WeatherLocation]

public extension WeatherLocationCollection {
    static func mock() -> [WeatherLocation] {
        [
            WeatherLocation.mock(name: "Austin", region: "Texas", country: "United States of America"),
            WeatherLocation.mock(name: "Dallas", region: "Texas", country: "United States of America"),
            WeatherLocation.mock(name: "Fort Worth", region: "Texas", country: "United States of America"),
            WeatherLocation.mock(name: "Houston", region: "Texas", country: "United States of America"),
            WeatherLocation.mock(name: "San Antonio", region: "Texas", country: "United States of America")
        ]
    }
}
