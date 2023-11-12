//
//  Pressure.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct Pressure: Equatable {
    public let inch: Double
    public let millibar: Double
    
    public init(inch: Double) {
        self.inch = inch
        
        let millibar = Measurement(
            value: inch,
            unit: UnitPressure.inchesOfMercury
        ).converted(to: UnitPressure.millibars).value
        
        self.millibar = millibar
    }
    
    public init(millibar: Double) {
        self.millibar = millibar
        
        let inch = Measurement(
            value: millibar,
            unit: UnitPressure.millibars
        ).converted(to: UnitPressure.inchesOfMercury).value
        
        self.inch = inch
    }
    
    public init(inch: Double, millibar: Double) {
        self.inch = inch
        self.millibar = millibar
    }
    
    public func formatted(
        unit: PressureUnit,
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

public extension Pressure {
    func getValue(for unit: PressureUnit) -> Double {
        switch unit {
        case .inch:     return inch
        case .millibar: return millibar
        }
    }
}

public extension Pressure {
    static func mock() -> Pressure {
        Pressure(
            inch: 30.36,
            millibar: 1028.0)
    }
}
