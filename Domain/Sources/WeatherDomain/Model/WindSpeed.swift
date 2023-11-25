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
                                integerLimits: 0...3,
                                fractionLimits: 0...1))
                        .grouping(.never)))
            .trimmingCharacters(
                in: includeUnitAbbreviation
                ? CharacterSet()
                : .whitespaces.union(.letters).union(.punctuationCharacters))
    }
}

public extension WindSpeed {
    func getMeasurement(for unit: WindSpeedUnit) -> Measurement<UnitSpeed> {
        switch unit {
        case .kilometersPerHour:
            return Measurement(
                value: kilometersPerHour,
                unit: UnitSpeed.kilometersPerHour)
        case .milesPerHour:
            return Measurement(
                value: milesPerHour,
                unit: UnitSpeed.milesPerHour)
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
