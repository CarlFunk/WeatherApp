//
//  SearchLocationResults+Mapping.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Data

extension SearchLocationResults {
    init(
        searchWeatherResponse: SearchWeatherResponse,
        favoriteLocationsResponse: FavoriteLocationsResponse,
        homeLocationResponse: HomeLocationResponse
    ) {
        self = searchWeatherResponse
            .map { locationResponseModel in
                WeatherLocation(
                    from: locationResponseModel,
                    isFavorite: favoriteLocationsResponse.contains(locationResponseModel.query),
                    isPrimary: homeLocationResponse == locationResponseModel.query)
            }
    }
}
