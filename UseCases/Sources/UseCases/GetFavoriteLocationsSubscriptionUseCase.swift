//
//  GetFavoriteLocationsSubscriptionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 10/22/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import FavoriteDomain
import WeatherDomain

public final class GetFavoriteLocationsSubscriptionUseCase {
    @Dependency(FavoriteRepository.self) private static var favoriteRepository
    
    public static func run() -> AsyncStream<LocationQueryCollection> {
        favoriteRepository.getLocationsSubscription().asyncStream()
    }
}
