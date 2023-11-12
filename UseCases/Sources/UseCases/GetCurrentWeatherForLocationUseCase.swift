//
//  GetCurrentWeatherForLocationUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import FavoriteDomain
import Foundation
import SettingsDomain
import WeatherDomain

public final class GetCurrentWeatherForLocationUseCase {
    @Dependency(FavoriteRepository.self) private static var favoriteRepository
    @Dependency(SettingsRepository.self) private static var settingsRepository
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run(location: String) async throws -> Weather {
        let weather = try await weatherRepository.getCurrentWeather(for: location, airQualityIncluded: false)
        let favoriteLocations = try await favoriteRepository.getLocations()
        let homeLocation = try await settingsRepository.getHomeLocation()
        
        let updatedWeatherLocation = weather.location.updated(
            isFavorite: favoriteLocations.contains(weather.location.query),
            isPrimary: homeLocation == weather.location.query)
        
        return weather.updated(location: updatedWeatherLocation)
    }
}
