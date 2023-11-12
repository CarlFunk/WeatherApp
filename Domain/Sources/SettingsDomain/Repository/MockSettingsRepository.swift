//
//  MockSettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Foundation
import WeatherDomain

public final class MockSettingsRepository: SettingsRepository {
    private let pressureUnitPublisher: CurrentValueSubject<PressureUnit, Never>
    private let temperatureUnitPublisher: CurrentValueSubject<TemperatureUnit, Never>
    private let windSpeedUnitPublisher: CurrentValueSubject<WindSpeedUnit, Never>
    private let homeLocationPublisher: CurrentValueSubject<String, Never>
    
    public init(
        pressureUnit: PressureUnit = .inch,
        temperatureUnit: TemperatureUnit = .fahrenheit,
        windSpeedUnit: WindSpeedUnit = .milesPerHour,
        homeLocation: String = WeatherLocation.standardQuery()
    ) {
        self.pressureUnitPublisher = .init(pressureUnit)
        self.temperatureUnitPublisher = .init(temperatureUnit)
        self.windSpeedUnitPublisher = .init(windSpeedUnit)
        self.homeLocationPublisher = .init(homeLocation)
    }
    
    public func getCurrentPressureUnitSubscription() -> AnyPublisher<PressureUnit, Never> {
        pressureUnitPublisher
            .eraseToAnyPublisher()
    }
    
    public func getCurrentTemperatureUnitSubscription() -> AnyPublisher<TemperatureUnit, Never> {
        temperatureUnitPublisher
            .eraseToAnyPublisher()
    }
    
    public func getCurrentWindSpeedUnitSubscription() -> AnyPublisher<WindSpeedUnit, Never> {
        windSpeedUnitPublisher
            .eraseToAnyPublisher()
    }
    
    public func getHomeLocationSubscription() -> AnyPublisher<String, Never> {
        homeLocationPublisher
            .eraseToAnyPublisher()
    }
    
    public func getCurrentPressureUnit() async throws -> PressureUnit {
        pressureUnitPublisher.value
    }
    
    public func getCurrentTemperatureUnit() async throws -> TemperatureUnit {
        temperatureUnitPublisher.value
    }
    
    public func getCurrentWindSpeedUnit() async throws -> WindSpeedUnit {
        windSpeedUnitPublisher.value
    }
    
    public func getHomeLocation() async throws -> String {
        homeLocationPublisher.value
    }
    
    public func setCurrentPressureUnit(_ pressureUnit: PressureUnit) async throws {
        pressureUnitPublisher.send(pressureUnit)
    }
    
    public func setCurrentTemperatureUnit(_ temperatureUnit: TemperatureUnit) async throws {
        temperatureUnitPublisher.send(temperatureUnit)
    }
    
    public func setCurrentWindSpeedUnit(_ windSpeedUnit: WindSpeedUnit) async throws {
        windSpeedUnitPublisher.send(windSpeedUnit)
    }
    
    public func setHomeLocation(_ location: String) async throws {
        homeLocationPublisher.send(location)
    }
}
