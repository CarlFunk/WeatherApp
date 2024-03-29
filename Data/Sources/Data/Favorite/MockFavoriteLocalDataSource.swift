//
//  MockFavoriteLocalDataSource.swift
//  FavoriteData
//
//  Created by Carl Funk on 11/2/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public final class MockFavoriteLocalDataSource: FavoriteLocalDataSource {
    public init() { }
    
    public func addLocation(_ location: String) async throws { }
    
    public func fetchLocations() async throws -> FavoriteLocationsResponse { return ["Dallas"] }
    
    public func removeLocation(_ location: String) async throws { }
}
