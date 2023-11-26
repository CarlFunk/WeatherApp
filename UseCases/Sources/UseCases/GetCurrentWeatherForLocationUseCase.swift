//
//  GetCurrentWeatherForLocationUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import WeatherDomain

public final class GetCurrentWeatherForLocationUseCase {
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run(location: LocationQuery) async throws -> Weather {
        return try await weatherRepository.getCurrentWeather(
            for: location.value,
            airQualityIncluded: false)
    }
}
