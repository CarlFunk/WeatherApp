//
//  MockSettingsLocalDataSource.swift
//  SettingsData
//
//  Created by Carl Funk on 11/2/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public final class MockSettingsLocalDataSource: SettingsLocalDataSource {
    public init() { }
    
    public func fetchCurrentPressureUnit() async throws -> String { "" }
    
    public func fetchCurrentTemperatureUnit() async throws -> String { "" }
    
    public func fetchCurrentWindSpeedUnit() async throws -> String { "" }
    
    public func fetchHomeLocation() async throws -> String { "" }
    
    public func updateCurrentPressureUnit(_ abbreviation: String) async throws { }
    
    public func updateCurrentTemperatureUnit(_ abbreviation: String) async throws { }
    
    public func updateCurrentWindSpeedUnit(_ abbreviation: String) async throws { }
    
    public func updateHomeLocation(_ location: String) async throws { }
}
