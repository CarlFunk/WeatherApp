//
//  Temperature.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct Temperature: Equatable {
    public let celcius: Double
    public let fahrenheit: Double
    
    public init(celcius: Double) {
        self.celcius = celcius
        
        let fahrenheit = Measurement(
            value: celcius,
            unit: UnitTemperature.celsius
        ).converted(to: UnitTemperature.fahrenheit).value
        
        self.fahrenheit = fahrenheit
    }
    
    public init(fahrenheit: Double) {
        self.fahrenheit = fahrenheit
        
        let celcius = Measurement(
            value: fahrenheit,
            unit: UnitTemperature.fahrenheit
        ).converted(to: UnitTemperature.celsius).value
        
        self.celcius = celcius
    }
    
    public init(celcius: Double, fahrenheit: Double) {
        self.celcius = celcius
        self.fahrenheit = fahrenheit
    }
    
    public func formatted(
        unit: TemperatureUnit,
        includeUnitAbbreviation: Bool
    ) -> String {
        return includeUnitAbbreviation
        ? getMeasurement(for: unit).formatted(.measurement(width: .abbreviated))
        : getMeasurement(for: unit).formatted(.measurement(width: .narrow))
    }
}

public extension Temperature {
    func getMeasurement(for unit: TemperatureUnit) -> Measurement<UnitTemperature> {
        switch unit {
        case .celcius:
            return Measurement(
                value: celcius,
                unit: UnitTemperature.celsius)
        case .fahrenheit:
            return Measurement(
                value: fahrenheit,
                unit: UnitTemperature.fahrenheit)
        }
    }
}

public extension Temperature {
    static func mock(random: Bool = true) -> Temperature {
        Temperature(
            celcius: 8.3,
            fahrenheit: 46.9)
    }
}
