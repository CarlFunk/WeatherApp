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
import Foundation
import WeatherDomain

public final class GetFavoriteLocationsSubscriptionUseCase {
    @Dependency(FavoriteRepository.self) private static var favoriteRepository
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run() -> AnyPublisher<[String], Never> {
        favoriteRepository.getLocationsSubscription()
    }
}
