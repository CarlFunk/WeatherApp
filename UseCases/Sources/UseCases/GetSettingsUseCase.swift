//
//  GetSettingsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import SettingsDomain

public final class GetSettingsUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run() async throws -> Settings {
        let pressureUnit = try await repository.getCurrentPressureUnit()
        let temperatureUnit = try await repository.getCurrentTemperatureUnit()
        let windSpeedUnit = try await repository.getCurrentWindSpeedUnit()
        
        return Settings(
            pressureUnit: pressureUnit,
            temperatureUnit: temperatureUnit,
            windSpeedUnit: windSpeedUnit)
    }
}
