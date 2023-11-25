//
//  Weather+Mapping.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/21/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import FavoriteData
import WeatherData
import SettingsData

extension Weather {
    init(
        weatherResponse: CurrentWeatherResponse,
        favoriteLocationsResponse: FavoriteLocationsResponse,
        homeLocationResponse: HomeLocationResponse
    ) {
        let locationQuery = WeatherLocation(from: weatherResponse.location).query
        
        self.init(
            from: weatherResponse,
            isFavorite: favoriteLocationsResponse.contains(locationQuery.value),
            isPrimary: homeLocationResponse == locationQuery.value)
    }
    
    init(
        from response: CurrentWeatherResponse,
        isFavorite: Bool = false,
        isPrimary: Bool = false
    ) {
        self.location = WeatherLocation(
            from: response.location,
            isFavorite: isFavorite,
            isPrimary: isPrimary)
        self.condition = WeatherCondition(
            from: response.current.condition)
        self.temperature = Temperature(
            celcius: response.current.temperatureCelcius,
            fahrenheit: response.current.temperatureFahrenheit)
        self.windSpeed = WindSpeed(
            kilometersPerHour: response.current.windSpeedKilometersPerHour,
            milesPerHour: response.current.windSpeedMilesPerHour)
        self.pressure = Pressure(
            inch: response.current.pressureInches,
            millibar: response.current.pressureMillibars)
        self.humidity = Humidity(
            value: response.current.humidityPercentage)
    }
}
