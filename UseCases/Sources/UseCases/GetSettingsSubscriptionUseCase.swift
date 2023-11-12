//
//  GetSettingsSubscriptionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import Foundation
import SettingsDomain

public final class GetSettingsSubscriptionUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run() -> AsyncStream<Settings> {
        Publishers.CombineLatest3(
            repository.getCurrentPressureUnitSubscription(),
            repository.getCurrentTemperatureUnitSubscription(),
            repository.getCurrentWindSpeedUnitSubscription())
            .map { pressureUnit, temperatureUnit, windSpeedUnit in
                Settings(
                    pressureUnit: pressureUnit,
                    temperatureUnit: temperatureUnit,
                    windSpeedUnit: windSpeedUnit)
            }
            .eraseToAnyPublisher()
            .asyncStream()
    }
}
