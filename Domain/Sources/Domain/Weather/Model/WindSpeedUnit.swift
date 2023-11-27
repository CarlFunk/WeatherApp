//
//  WindSpeedUnit.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public enum WindSpeedUnit: CaseIterable, Equatable, Identifiable {
    case kilometersPerHour
    case milesPerHour
    
    public init?(abbreviation: String) {
        switch abbreviation {
        case "km/h":   self = .kilometersPerHour
        case "mph":   self = .milesPerHour
        default:    return nil
        }
    }
    
    public var id: String {
        return abbreviation
    }
    
    public var name: String {
        switch self {
        case .kilometersPerHour:    return "Kilometers per hour"
        case .milesPerHour:         return "Miles per hour"
        }
    }
    
    public var abbreviation: String {
        switch self {
        case .kilometersPerHour:    return "km/h"
        case .milesPerHour:         return "mph"
        }
    }
}

public extension WindSpeedUnit {
    static func mock() -> WindSpeedUnit {
        .milesPerHour
    }
}
