//
//  GetTwentyFourHourForecastForDateUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Domain

public final class GetTwentyFourHourForecastForDateUseCase {
    @Dependency(WeatherRepository.self) private static var repository
    
    public static func run(location: LocationQuery) async throws -> [HourForecast] {
        try await repository.getHourForecast(
            for: location,
            days: 2,
            airQualityIncluded: false,
            weatherAlertsIncluded: false)
    }
}
