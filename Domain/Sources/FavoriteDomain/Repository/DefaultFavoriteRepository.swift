//
//  DefaultFavoriteRepository.swift
//  FavoriteDomain
//
//  Created by Carl Funk on 10/22/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import FavoriteData
import Foundation
import WeatherDomain

public final class DefaultFavoriteRepository: FavoriteRepository {
    @Dependency(FavoriteLocalDataSource.self) private var localDataSource
    
    private static let locationsPublisher = CurrentValueSubject<[String], Never>([])
    
    public init() { }
    
    public func getLocationsSubscription() -> AnyPublisher<[String], Never> {
        if DefaultFavoriteRepository.locationsPublisher.value.isEmpty {
            return Future<[String], Never> { promise in
                Task {
                    let locations: [String]
                    do {
                        locations = try await self.getLocations()
                    } catch {
                        locations = []
                    }
                    
                    DefaultFavoriteRepository.locationsPublisher.value = locations
                    promise(.success(locations))
                }
            }
            .flatMap { unit in
                return DefaultFavoriteRepository.locationsPublisher
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        } else {
            return DefaultFavoriteRepository.locationsPublisher
                .eraseToAnyPublisher()
        }
    }
    
    public func getLocations() async throws -> [String] {
        try await localDataSource.fetchLocations()
    }
    
    public func addLocation(_ location: WeatherLocation) async throws {
        do {
            try await localDataSource.addLocation(location.query)
            let locations = try await getLocations()
            await MainActor.run {
                DefaultFavoriteRepository.locationsPublisher.send(locations)
            }
        } catch {
            throw error
        }
    }
    
    public func removeLocation(_ location: WeatherLocation) async throws {
        do {
            try await localDataSource.removeLocation(location.query)
            let locations = try await getLocations()
            await MainActor.run { DefaultFavoriteRepository.locationsPublisher.send(locations)
            }
        } catch {
            throw error
        }
    }
}
