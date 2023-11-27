//
//  DefaultSettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Data
import Dependency

public final class DefaultSettingsRepository: SettingsRepository {
    private static let settingsPublisher = CurrentValueSubject<Settings?, Never>(nil)
    private static let homeLocationPublisher = CurrentValueSubject<LocationQuery?, Never>(nil)
    
    @Dependency(SettingsLocalDataSource.self) private var localDataSource
    
    public init() { }
    
    public func getSettingsSubscription() -> AnyPublisher<Settings, Never> {
        if DefaultSettingsRepository.settingsPublisher.value == nil {
            return Future<Settings, Never> { promise in
                Task {
                    let settings: Settings
                    do {
                        settings = try await self.getSettings()
                    } catch {
                        settings = .default()
                    }
                    
                    DefaultSettingsRepository.settingsPublisher.value = settings
                    promise(.success(settings))
                }
            }
            .flatMap { unit in
                return DefaultSettingsRepository.settingsPublisher
                    .compactMap { $0 }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        } else {
            return DefaultSettingsRepository.settingsPublisher
                .compactMap { $0 }
                .eraseToAnyPublisher()
        }
    }
    
    public func getHomeLocationSubscription() -> AnyPublisher<LocationQuery, Never> {
        if DefaultSettingsRepository.homeLocationPublisher.value == nil {
            return Future<LocationQuery, Never> { promise in
                Task {
                    let homeLocation: LocationQuery
                    do {
                        homeLocation = try await self.getHomeLocation()
                    } catch {
                        homeLocation = LocationQuery.default()
                    }
                    
                    DefaultSettingsRepository.homeLocationPublisher.value = homeLocation
                    promise(.success(homeLocation))
                }
            }
            .flatMap { homeLocation in
                return DefaultSettingsRepository.homeLocationPublisher
                    .compactMap { $0 }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        } else {
            return DefaultSettingsRepository.homeLocationPublisher
                .compactMap { $0 }
                .eraseToAnyPublisher()
        }
    }
    
    public func getSettings() async throws -> Settings {
        do {
            let response = try await localDataSource.fetchWeatherSettings()
            return Settings(from: response)
        } catch {
            return Settings.default()
        }
    }
    
    public func getHomeLocation() async throws -> LocationQuery {
        let defaultHomeLocation = LocationQuery.default()
        
        do {
            let value = try await localDataSource.fetchHomeLocation()
            return LocationQuery(value: value)
        } catch {
            return defaultHomeLocation
        }
    }
    
    public func setSettings(_ settings: Settings) async throws {
        let request = WeatherSettingsUpdateRequest(
            pressureUnitAbbreviation: settings.pressureUnit.abbreviation,
            temperatureUnitAbbreviation: settings.temperatureUnit.abbreviation,
            windSpeedUnitAbbreviation: settings.windSpeedUnit.abbreviation)
        
        try await localDataSource.updateWeatherSettings(request)
        await MainActor.run {
            DefaultSettingsRepository.settingsPublisher.send(settings)
        }
    }
    
    public func setHomeLocation(_ location: WeatherLocation) async throws {
        try await localDataSource.updateHomeLocation(location.query.value)
        await MainActor.run {
            DefaultSettingsRepository.homeLocationPublisher.send(location.query)
        }
    }
}
