//
//  TemperatureUnit.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public enum TemperatureUnit: CaseIterable, Equatable, Identifiable {
    case celcius
    case fahrenheit
    
    public init?(abbreviation: String) {
        switch abbreviation {
        case "C":   self = .celcius
        case "F":   self = .fahrenheit
        default:    return nil
        }
    }
    
    public var id: String {
        return abbreviation
    }
    
    public var name: String {
        switch self {
        case .celcius:      return "Celcius"
        case .fahrenheit:   return "Fahrenheit"
        }
    }
    
    public var abbreviation: String {
        switch self {
        case .celcius:      return "C"
        case .fahrenheit:   return "F"
        }
    }
}

public extension TemperatureUnit {
    static func mock() -> TemperatureUnit {
        .fahrenheit
    }
}
