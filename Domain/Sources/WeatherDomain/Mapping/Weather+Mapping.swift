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
        self.init(
            from: weatherResponse,
            isFavorite: favoriteLocationsResponse.contains(weatherResponse.location.name),
            isPrimary: homeLocationResponse == weatherResponse.location.name)
    }
    
    init(
        from response: CurrentWeatherResponse,
        isFavorite: Bool = false,
        isPrimary: Bool = false
    ) {
        self.location = WeatherLocation(
            id: response.location.name,
            name: response.location.name,
            region: response.location.region,
            country: response.location.country,
            coordinate: GeographicCoordinate(
                latitude: response.location.latitude,
                longitude: response.location.longitude),
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
