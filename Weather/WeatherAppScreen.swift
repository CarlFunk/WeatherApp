//
//  WeatherAppScreen.swift
//  Weather
//
//  Created by Carl Funk on 10/20/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Domain
import Navigation
import SwiftUI
import Screens

struct WeatherAppScreen: NavigationScreen {
    static func == (lhs: WeatherAppScreen, rhs: WeatherAppScreen) -> Bool {
        lhs.title == rhs.title
    }

    let title: String
    let view: (NavigationCoordinator<WeatherAppScreen>) -> any View

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

extension WeatherAppScreen {
    static let home = WeatherAppScreen(title: "home", view: { _ in HomeScreen() })
}

extension WeatherAppScreen {
    static func locationWeather(location: LocationQuery) -> WeatherAppScreen {
        WeatherAppScreen(title: "locationWeather", view: { _ in
            LocationWeatherScreen(
                location: location)
        })
    }
}

extension WeatherAppScreen {
    static let search = WeatherAppScreen(title: "search", view: { coordinator in
        FavoriteScreen { [weak coordinator] navigationRequest in
            switch navigationRequest {
            case .viewLocation(let location):
                coordinator?.navigate(to: Navigation(
                    screen: .locationWeather(location: location)))
            }
        }
    })
}

extension WeatherAppScreen {
    static let settings = WeatherAppScreen(title: "settings", view: { _ in SettingsScreen() })
}
