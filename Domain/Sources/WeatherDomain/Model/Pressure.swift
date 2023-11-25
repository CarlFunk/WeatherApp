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
        includeUnitAbbreviation: Bool
    ) -> String {
        getMeasurement(for: unit)
            .formatted(
                .measurement(
                    width: .abbreviated,
                    usage: .asProvided,
                    numberFormatStyle: .number
                        .precision(
                            .integerAndFractionLength(
                                integerLimits: 0...4,
                                fractionLimits: 0...3))
                        .grouping(.never)))
            .trimmingCharacters(
                in: includeUnitAbbreviation
                ? CharacterSet()
                : .whitespaces.union(.letters).union(.punctuationCharacters))
    }
}

public extension Pressure {
    func getMeasurement(for unit: PressureUnit) -> Measurement<UnitPressure> {
        switch unit {
        case .inch:
            return Measurement(
                value: inch,
                unit: UnitPressure.inchesOfMercury)
        case .millibar:
            return Measurement(
                value: millibar,
                unit: UnitPressure.millibars)
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
