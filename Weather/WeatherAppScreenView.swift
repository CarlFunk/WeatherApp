//
//  WeatherAppScreenView.swift
//  Weather
//
//  Created by Carl Funk on 10/20/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Navigation
import Screens
import SwiftUI

struct ApplicationRouterView: View {
    let navigation: Navigation<WeatherAppScreen>
    
    unowned let coordinator: NavigationCoordinator<WeatherAppScreen>
    
    var body: some View {
        switch navigation.screen {
        case .home:
            HomeScreen()
        case .locationWeather(let location):
            LocationWeatherScreen(
                location: location)
        case .search:
            FavoriteScreen { [weak coordinator] navigationRequest in
                switch navigationRequest {
                case .viewLocation(let location):
                    coordinator?.navigate(to: Navigation(
                        screen: .locationWeather(location: location)))
                }
            }
        case .settings:
            SettingsScreen()
        }
    }
}
