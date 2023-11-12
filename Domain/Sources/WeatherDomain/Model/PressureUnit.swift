//
//  PressureUnit.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public enum PressureUnit: CaseIterable, Equatable, Identifiable {
    case inch
    case millibar
    
    public init?(abbreviation: String) {
        switch abbreviation {
        case "inHg":    self = .inch
        case "mBar":    self = .millibar
        default:        return nil
        }
    }
    
    public var id: String {
        return abbreviation
    }
    
    public var name: String {
        switch self {
        case .inch:      return "Inch"
        case .millibar:   return "Millibar"
        }
    }
    
    public var abbreviation: String {
        switch self {
        case .inch:      return "inHg"
        case .millibar:   return "mBar"
        }
    }
}

public extension PressureUnit {
    static func mock() -> PressureUnit {
        .inch
    }
}
