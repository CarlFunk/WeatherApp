//
//  SettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Foundation
import WeatherDomain

public protocol SettingsRepository {
    func getCurrentPressureUnitSubscription() -> AnyPublisher<PressureUnit, Never>
    func getCurrentTemperatureUnitSubscription() -> AnyPublisher<TemperatureUnit, Never>
    func getCurrentWindSpeedUnitSubscription() -> AnyPublisher<WindSpeedUnit, Never>
    func getHomeLocationSubscription() -> AnyPublisher<String, Never>
    
    func getCurrentPressureUnit() async throws -> PressureUnit
    func getCurrentTemperatureUnit() async throws -> TemperatureUnit
    func getCurrentWindSpeedUnit() async throws -> WindSpeedUnit
    func getHomeLocation() async throws -> String
    
    func setCurrentPressureUnit(_ pressureUnit: PressureUnit) async throws
    func setCurrentTemperatureUnit(_ temperatureUnit: TemperatureUnit) async throws
    func setCurrentWindSpeedUnit(_ windSpeedUnit: WindSpeedUnit) async throws
    func setHomeLocation(_ location: String) async throws
}
