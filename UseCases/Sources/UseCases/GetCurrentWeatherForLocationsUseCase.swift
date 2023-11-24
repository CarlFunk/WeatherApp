//
//  GetCurrentWeatherForLocationsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import WeatherDomain

public final class GetCurrentWeatherForLocationsUseCase {
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run(locations: [String]) async throws -> WeatherCollection {
        var collection = WeatherCollection()
        
        if locations.isEmpty { return collection }
        
        for location in locations {
            let weather = try await weatherRepository.getCurrentWeather(for: location, airQualityIncluded: false)
            collection.append(weather)
        }
        return collection
    }
}
