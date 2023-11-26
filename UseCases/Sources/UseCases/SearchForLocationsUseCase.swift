//
//  SearchForLocationsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import WeatherDomain

public final class SearchForLocationsUseCase {
    @Dependency(WeatherRepository.self) private static var weatherRepository
    
    public static func run(search: String) async throws -> SearchLocationResults {
        if search.isEmpty { return [] }
        return try await weatherRepository.getLocations(for: search)
    }
}
