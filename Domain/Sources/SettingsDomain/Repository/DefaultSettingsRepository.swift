//
//  DefaultSettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import Foundation
import SettingsData
import WeatherDomain

public final class DefaultSettingsRepository: SettingsRepository {
    private static let pressureUnitPublisher = CurrentValueSubject<PressureUnit?, Never>(nil)
    private static let temperatureUnitPublisher = CurrentValueSubject<TemperatureUnit?, Never>(nil)
    private static let windSpeedUnitPublisher = CurrentValueSubject<WindSpeedUnit?, Never>(nil)
    private static let homeLocationPublisher = CurrentValueSubject<String?, Never>(nil)
    
    @Dependency(SettingsLocalDataSource.self) private var localDataSource
    
    public init() { }
    
    public func getCurrentPressureUnitSubscription() -> AnyPublisher<PressureUnit, Never> {
        if DefaultSettingsRepository.pressureUnitPublisher.value == nil {
            return Future<PressureUnit, Never> { promise in
                Task {
                    let unit: PressureUnit
                    do {
                        unit = try await self.getCurrentPressureUnit()
                    } catch {
                        unit = PressureUnit.millibar
                    }
                    
                    DefaultSettingsRepository.pressureUnitPublisher.value = unit
                    promise(.success(unit))
                }
            }
            .flatMap { unit in
                return DefaultSettingsRepository.pressureUnitPublisher
                    .compactMap { $0 }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        } else {
            return DefaultSettingsRepository.pressureUnitPublisher
                .compactMap { $0 }
                .eraseToAnyPublisher()
        }
    }
    
    public func getCurrentTemperatureUnitSubscription() -> AnyPublisher<TemperatureUnit, Never> {
        if DefaultSettingsRepository.temperatureUnitPublisher.value == nil {
            return Future<TemperatureUnit, Never> { promise in
                Task {
                    let unit: TemperatureUnit
                    do {
                        unit = try await self.getCurrentTemperatureUnit()
                    } catch {
                        unit = TemperatureUnit.fahrenheit
                    }
                    
                    DefaultSettingsRepository.temperatureUnitPublisher.value = unit
                    promise(.success(unit))
                }
            }
            .flatMap { unit in
                return DefaultSettingsRepository.temperatureUnitPublisher
                    .compactMap { $0 }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        } else {
            return DefaultSettingsRepository.temperatureUnitPublisher
                .compactMap { $0 }
                .eraseToAnyPublisher()
        }
    }
    
    public func getCurrentWindSpeedUnitSubscription() -> AnyPublisher<WindSpeedUnit, Never> {
        if DefaultSettingsRepository.windSpeedUnitPublisher.value == nil {
            return Future<WindSpeedUnit, Never> { promise in
                Task {
                    let unit: WindSpeedUnit
                    do {
                        unit = try await self.getCurrentWindSpeedUnit()
                    } catch {
                        unit = WindSpeedUnit.kilometersPerHour
                    }
                    
                    DefaultSettingsRepository.windSpeedUnitPublisher.value = unit
                    promise(.success(unit))
                }
            }
            .flatMap { unit in
                return DefaultSettingsRepository.windSpeedUnitPublisher
                    .compactMap { $0 }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        } else {
            return DefaultSettingsRepository.windSpeedUnitPublisher
                .compactMap { $0 }
                .eraseToAnyPublisher()
        }
    }
    
    public func getHomeLocationSubscription() -> AnyPublisher<String, Never> {
        if DefaultSettingsRepository.homeLocationPublisher.value == nil {
            return Future<String, Never> { promise in
                Task {
                    let homeLocation: String
                    do {
                        homeLocation = try await self.getHomeLocation()
                    } catch {
                        homeLocation = WeatherLocation.standardQuery()
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
    
    public func getCurrentPressureUnit() async throws -> PressureUnit {
        let defaultUnit: PressureUnit = .millibar
        
        do {
            let abbreviation = try await localDataSource.fetchCurrentPressureUnit()
            guard let unit = PressureUnit(abbreviation: abbreviation) else {
                return defaultUnit
            }
            return unit
        } catch {
            return defaultUnit
        }
    }
    
    public func getCurrentTemperatureUnit() async throws -> TemperatureUnit {
        let defaultUnit: TemperatureUnit = .fahrenheit
        
        do {
            let abbreviation = try await localDataSource.fetchCurrentTemperatureUnit()
            guard let unit = TemperatureUnit(abbreviation: abbreviation) else {
                return defaultUnit
            }
            return unit
        } catch {
            return defaultUnit
        }
    }
    
    public func getCurrentWindSpeedUnit() async throws -> WindSpeedUnit {
        let defaultUnit: WindSpeedUnit = .milesPerHour
        
        do {
            let abbreviation = try await localDataSource.fetchCurrentWindSpeedUnit()
            guard let unit = WindSpeedUnit(abbreviation: abbreviation) else {
                return defaultUnit
            }
            
            return unit
        } catch {
            return defaultUnit
        }
    }
    
    public func getHomeLocation() async throws -> String {
        let defaultHomeLocation: String = WeatherLocation.standardQuery()
        
        do {
            return try await localDataSource.fetchHomeLocation()
        } catch {
            return defaultHomeLocation
        }
    }
    
    public func setCurrentPressureUnit(_ pressureUnit: PressureUnit) async throws {
        try await localDataSource.updateCurrentPressureUnit(pressureUnit.abbreviation)
        await MainActor.run {
            DefaultSettingsRepository.pressureUnitPublisher.send(pressureUnit)
        }
    }
    
    public func setCurrentTemperatureUnit(_ temperatureUnit: TemperatureUnit) async throws {
        try await localDataSource.updateCurrentTemperatureUnit(temperatureUnit.abbreviation)
        await MainActor.run {
            DefaultSettingsRepository.temperatureUnitPublisher.send(temperatureUnit)
        }
    }
    
    public func setCurrentWindSpeedUnit(_ windSpeedUnit: WindSpeedUnit) async throws {
        try await localDataSource.updateCurrentWindSpeedUnit(windSpeedUnit.abbreviation)
        await MainActor.run {
            DefaultSettingsRepository.windSpeedUnitPublisher.send(windSpeedUnit)
        }
    }
    
    public func setHomeLocation(_ location: String) async throws {
        try await localDataSource.updateHomeLocation(location)
        await MainActor.run {
            DefaultSettingsRepository.homeLocationPublisher.send(location)
        }
    }
}
