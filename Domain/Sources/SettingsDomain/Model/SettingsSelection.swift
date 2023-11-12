//
//  SettingsSelection.swift
//  SettingsDomain
//
//  Created by Carl Funk on 10/21/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public enum SettingsSelection: String, Equatable, Identifiable {
    case pressure
    case temperature
    case windSpeed
    
    public var id: String {
        rawValue
    }
}
