//
//  WeatherLocation+Mapping.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import WeatherData

extension WeatherLocation {
    init(
        from response: LocationInnerResponseModel,
        isFavorite: Bool = false,
        isPrimary: Bool = false
    ) {
        self.init(
            id: response.name,
            name: response.name,
            region: response.region,
            country: response.country,
            query: LocationQuery.generate(
                name: response.name,
                region: response.region,
                country: response.country),
            coordinate: GeographicCoordinate(
                latitude: response.latitude,
                longitude: response.longitude),
            isFavorite: isFavorite,
            isPrimary: isPrimary)
    }
}
