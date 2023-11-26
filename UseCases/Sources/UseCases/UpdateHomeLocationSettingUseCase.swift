//
//  UpdateHomeLocationSettingUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import SettingsDomain
import WeatherDomain

public final class UpdateHomeLocationSettingUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run(weather: Weather) async throws -> Weather {
        try await repository.setHomeLocation(weather.location)
        let weatherLocation = weather.location.updated(isPrimary: true)
        return weather.updated(location: weatherLocation)
    }
}
