//
//  Humidity.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct Humidity: Equatable {
    public let value: Int
    
    public init(value: Int) {
        self.value = value
    }
    
    public func formatted() -> String {
        return value.formatted(.percent)
    }
}

public extension Humidity {
    static func mock(
        value: Int = 71
    ) -> Humidity {
        Humidity(value: value)
    }
}
