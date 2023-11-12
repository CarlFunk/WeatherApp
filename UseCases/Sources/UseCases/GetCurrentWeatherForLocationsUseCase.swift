//
//  GetCurrentWeatherForLocationsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import FavoriteDomain
import Foundation
import WeatherDomain

public final class GetCurrentWeatherForLocationsUseCase {
    @Dependency(FavoriteRepository.self) private static var favoriteRepository
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run(locations: [String]) async throws -> WeatherCollection {
        var collection = WeatherCollection()
        
        if locations.isEmpty { return collection }
        
        let favoriteLocations = try await favoriteRepository.getLocations()
        for location in locations {
            let weather = try await weatherRepository.getCurrentWeather(for: location, airQualityIncluded: false)
            let weatherLocation = weather.location.updated(
                isFavorite: favoriteLocations.contains(location))
            let updatedWeather = weather.updated(
                location: weatherLocation)
            collection.append(updatedWeather)
        }
        return collection
    }
}
