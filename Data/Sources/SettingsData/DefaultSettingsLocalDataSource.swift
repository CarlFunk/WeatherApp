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
    
    public func fetchWeatherSettings() async throws -> WeatherSettingsResponse {
        WeatherSettingsResponse(
            pressureUnit: store.string(forKey: StorageKeys.pressureUnit.rawValue) ?? "",
            temperatureUnit: store.string(forKey: StorageKeys.temperatureUnit.rawValue) ?? "",
            windSpeedUnit: store.string(forKey: StorageKeys.windSpeedUnit.rawValue) ?? "")
    }
    
    public func fetchHomeLocation() async throws -> HomeLocationResponse {
        guard let storedHomeLocation = store.string(forKey: StorageKeys.homeLocation.rawValue) else {
            throw DataSourceError.homeLocationNotSet
        }
        
        return storedHomeLocation
    }
    
    public func updateWeatherSettings(_ request: WeatherSettingsUpdateRequest) async throws {
        store.setValue(request.pressureUnitAbbreviation, forKey: StorageKeys.pressureUnit.rawValue)
        store.setValue(request.temperatureUnitAbbreviation, forKey: StorageKeys.temperatureUnit.rawValue)
        store.setValue(request.windSpeedUnitAbbreviation, forKey: StorageKeys.windSpeedUnit.rawValue)
    }
    
    public func updateHomeLocation(_ location: String) async throws {
        store.setValue(location, forKey: StorageKeys.homeLocation.rawValue)
    }
}
