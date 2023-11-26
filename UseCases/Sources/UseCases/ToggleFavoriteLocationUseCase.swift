//
//  ToggleFavoriteLocationUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 10/26/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Dependency
import FavoriteDomain
import Foundation
import WeatherDomain

public final class ToggleFavoriteLocationUseCase {
    @Dependency(FavoriteRepository.self) private static var repository
    
    public static func run(weather: Weather) async throws -> Weather {
        let newLocation = try await run(weatherLocation: weather.location)
        return weather.updated(location: newLocation)
    }
    
    public static func run(weatherLocation: WeatherLocation) async throws -> WeatherLocation {
        let newIsFavorite = !weatherLocation.isFavorite
        if newIsFavorite {
            try await repository.addLocation(weatherLocation)
        } else {
            try await repository.removeLocation(weatherLocation)
        }
        
        return weatherLocation.updated(isFavorite: newIsFavorite)
    }
}
