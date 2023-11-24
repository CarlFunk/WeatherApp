//
//  FavoriteLocalDataSource.swift
//  FavoriteData
//
//  Created by Carl Funk on 10/21/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public protocol FavoriteLocalDataSource {
    func addLocation(_ location: String) async throws
    func fetchLocations() async throws -> FavoriteLocationsResponse
    func removeLocation(_ location: String) async throws
}
