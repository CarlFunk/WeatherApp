//
//  MockFavoriteRepository.swift
//  FavoriteDomain
//
//  Created by Carl Funk on 10/22/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Combine

public final class MockFavoriteRepository: FavoriteRepository {
    private let locationsPublisher: CurrentValueSubject<LocationQueryCollection, Never>
    
    public init(locations: LocationQueryCollection = .mock()) {
        locationsPublisher = .init(locations)
    }
    
    public func getLocationsSubscription() -> AnyPublisher<LocationQueryCollection, Never> {
        locationsPublisher
            .eraseToAnyPublisher()
    }
    
    public func getLocations() async throws -> LocationQueryCollection {
        locationsPublisher.value
    }
    
    public func addLocation(_ location: WeatherLocation) async throws {
        var locations = locationsPublisher.value
        if !locations.contains(location.query) {
            locations.append(location.query)
        }
        locationsPublisher.send(locations)
    }
    
    public func removeLocation(_ location: WeatherLocation) async throws {
        var locations = locationsPublisher.value
        locations.removeAll(where: { $0 == location.query })
        locationsPublisher.send(locations)
    }
}
