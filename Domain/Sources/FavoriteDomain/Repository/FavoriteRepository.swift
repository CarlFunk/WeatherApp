//
//  FavoriteRepository.swift
//  FavoriteDomain
//
//  Created by Carl Funk on 10/22/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Combine
import Foundation
import WeatherDomain

public protocol FavoriteRepository {
    func getLocationsSubscription() -> AnyPublisher<LocationQueryCollection, Never>
    func getLocations() async throws -> LocationQueryCollection
    
    func addLocation(_ location: WeatherLocation) async throws
    func removeLocation(_ location: WeatherLocation) async throws
}
