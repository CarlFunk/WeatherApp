//
//  GetCurrentForecastForLocationUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/19/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import WeatherDomain

public final class GetCurrentForecastForLocationUseCase {
    enum UseCaseError: Error {
        case missingDayForecast
    }
    
    @Dependency(WeatherRepository.self) private static var repository
    
    public static func run(location: String) async throws -> DayForecast {
        guard let dayForecast = try await repository.getDayForecast(
            for: location,
            days: 1,
            airQualityIncluded: false,
            weatherAlertsIncluded: false)
                .first
        else {
            throw UseCaseError.missingDayForecast
        }
        
        return dayForecast
    }
}
