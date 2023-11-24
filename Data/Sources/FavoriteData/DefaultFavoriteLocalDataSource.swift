//
//  DefaultFavoriteLocalDataSource.swift
//  FavoriteData
//
//  Created by Carl Funk on 10/21/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public final class DefaultFavoriteLocalDataSource: FavoriteLocalDataSource {
    private enum StorageKeys: String {
        case favoriteLocations
    }
    
    public enum DataSourceError: Error {
        case pressureUnitNotSet
    }
    
    private let store: UserDefaults
    
    public init(store: UserDefaults = .standard) {
        self.store = store
    }
    
    public func addLocation(_ location: String) async throws {
        do {
            var locations = try await fetchLocations()
            if !locations.contains(location) {
                locations.append(location)
            }
            setLocations(locations)
        } catch {
            setLocations([])
        }
    }
    
    public func fetchLocations() async throws -> FavoriteLocationsResponse {
        store.array(forKey: StorageKeys.favoriteLocations.rawValue) as? [String] ?? [String]()
    }
    
    public func removeLocation(_ location: String) async throws {
        do {
            var locations = try await fetchLocations()
            locations.removeAll(where: { $0 == location })
            setLocations(locations)
        } catch {
            setLocations([])
        }
    }
    
    private func setLocations(_ locations: [String]) {
        store.setValue(locations, forKey: StorageKeys.favoriteLocations.rawValue)
    }
}
