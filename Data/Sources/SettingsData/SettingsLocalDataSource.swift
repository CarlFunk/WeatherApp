//
//  SettingsLocalDataSource.swift
//  SettingsData
//
//  Created by Carl Funk on 10/21/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public protocol SettingsLocalDataSource {
    func fetchCurrentPressureUnit() async throws -> String
    func fetchCurrentTemperatureUnit() async throws -> String
    func fetchCurrentWindSpeedUnit() async throws -> String
    func fetchHomeLocation() async throws -> String
    
    func updateCurrentPressureUnit(_ abbreviation: String) async throws
    func updateCurrentTemperatureUnit(_ abbreviation: String) async throws
    func updateCurrentWindSpeedUnit(_ abbreviation: String) async throws
    func updateHomeLocation(_ location: String) async throws
}
