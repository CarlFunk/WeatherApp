//
//  DefaultSettingsLocalDataSource.swift
//  SettingsData
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public final class DefaultSettingsLocalDataSource: SettingsLocalDataSource {
    private enum StorageKeys: String {
        case pressureUnit
        case temperatureUnit
        case windSpeedUnit
        case homeLocation
    }
    
    public enum DataSourceError: Error {
        case pressureUnitNotSet
        case temperatureUnitNotSet
        case windSpeedUnitNotSet
        case homeLocationNotSet
    }
    
    private let store: UserDefaults
    
    public init(store: UserDefaults = .standard) {
        self.store = store
    }
    
    public func fetchCurrentPressureUnit() async throws -> String {
        guard let storedUnitString = store.string(forKey: StorageKeys.pressureUnit.rawValue) else {
            throw DataSourceError.pressureUnitNotSet
        }
        
        return storedUnitString
    }
    
    public func fetchCurrentTemperatureUnit() async throws -> String {
        guard let storedUnitString = store.string(forKey: StorageKeys.temperatureUnit.rawValue) else {
            throw DataSourceError.temperatureUnitNotSet
        }
        
        return storedUnitString
    }
    
    public func fetchCurrentWindSpeedUnit() async throws -> String {
        guard let storedUnitString = store.string(forKey: StorageKeys.windSpeedUnit.rawValue) else {
            throw DataSourceError.windSpeedUnitNotSet
        }
        
        return storedUnitString
    }
    
    public func fetchHomeLocation() async throws -> String {
        guard let storedHomeLocation = store.string(forKey: StorageKeys.homeLocation.rawValue) else {
            throw DataSourceError.homeLocationNotSet
        }
        
        return storedHomeLocation
    }
    
    public func updateCurrentPressureUnit(_ abbreviation: String) async throws {
        store.setValue(abbreviation, forKey: StorageKeys.pressureUnit.rawValue)
    }
    
    public func updateCurrentTemperatureUnit(_ abbreviation: String) async throws {
        store.setValue(abbreviation, forKey: StorageKeys.temperatureUnit.rawValue)
    }
    
    public func updateCurrentWindSpeedUnit(_ abbreviation: String) async throws {
        store.setValue(abbreviation, forKey: StorageKeys.windSpeedUnit.rawValue)
    }
    
    public func updateHomeLocation(_ location: String) async throws {
        store.setValue(location, forKey: StorageKeys.homeLocation.rawValue)
    }
}
