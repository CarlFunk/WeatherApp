//
//  GetSevenDayForecastUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 2/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import WeatherDomain

public final class GetSevenDayForecastUseCase {
    @Dependency(WeatherRepository.self) private static var repository
    
    public static func run(location: LocationQuery) async throws -> MultiDayForecast {
        try await repository.getDayForecast(
            for: location.value,
            days: 7,
            airQualityIncluded: false,
            weatherAlertsIncluded: false)
    }
}
