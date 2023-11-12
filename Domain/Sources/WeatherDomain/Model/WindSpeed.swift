//
//  WindSpeed.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct WindSpeed: Equatable {
    public let kilometersPerHour: Double
    public let milesPerHour: Double
    
    public init(kilometersPerHour: Double) {
        self.kilometersPerHour = kilometersPerHour
        
        let milesPerHour = Measurement(
            value: kilometersPerHour,
            unit: UnitSpeed.kilometersPerHour
        ).converted(to: UnitSpeed.milesPerHour).value
        
        self.milesPerHour = milesPerHour
    }
    
    public init(milesPerHour: Double) {
        self.milesPerHour = milesPerHour
        
        let kilometersPerHour = Measurement(
            value: milesPerHour,
            unit: UnitSpeed.milesPerHour
        ).converted(to: UnitSpeed.kilometersPerHour).value
        
        self.kilometersPerHour = kilometersPerHour
    }
    
    public init(kilometersPerHour: Double, milesPerHour: Double) {
        self.kilometersPerHour = kilometersPerHour
        self.milesPerHour = milesPerHour
    }
    
    public func formatted(
        unit: WindSpeedUnit,
        maxFractionDigits: Int = 3,
        includeUnitAbbreviation: Bool
    ) -> String {
        let valueDecimal = getValue(for: unit)
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = maxFractionDigits
        let value = numberFormatter.string(from: NSNumber(value: valueDecimal)) ?? "\(valueDecimal)"
        let unitAbbreviation = unit.abbreviation
        
        return includeUnitAbbreviation ? "\(value) \(unitAbbreviation)" : "\(value)"
    }
}

public extension WindSpeed {
    func getValue(for unit: WindSpeedUnit) -> Double {
        switch unit {
        case .kilometersPerHour:    return kilometersPerHour
        case .milesPerHour:         return milesPerHour
        }
    }
}

public extension WindSpeed {
    static func mock() -> WindSpeed {
        WindSpeed(
            kilometersPerHour: 9.0,
            milesPerHour: 5.6)
    }
}
