//
//  SearchForLocationsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import FavoriteDomain
import Foundation
import WeatherDomain

public final class SearchForLocationsUseCase {
    @Dependency(FavoriteRepository.self) private static var favoriteRepository
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run(search: String) async throws -> [SearchLocation] {
        if search.isEmpty { return [] }
        
        let searchLocations = try await weatherRepository.getLocations(for: search)
        let favoriteLocations = try await favoriteRepository.getLocations()
        
        return searchLocations.map { searchLocation in
            if favoriteLocations.contains(searchLocation.locationQuery) {
                let updatedLocation = searchLocation.location.updated(isFavorite: true)
                return searchLocation.updated(location: updatedLocation)
            }
            return searchLocation
        }
    }
}
