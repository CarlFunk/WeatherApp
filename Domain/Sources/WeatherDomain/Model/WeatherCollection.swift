//
//  WeatherCollection.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public typealias WeatherCollection = [Weather]

public extension WeatherCollection {
    static func mock() -> WeatherCollection {
        [
            Weather.mock(name: "Austin"),
            Weather.mock(name: "Dallas"),
            Weather.mock(name: "Fort Worth"),
            Weather.mock(name: "Houston"),
            Weather.mock(name: "San Antonio")
        ]
    }
}
