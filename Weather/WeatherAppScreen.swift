//
//  WeatherAppScreen.swift
//  Weather
//
//  Created by Carl Funk on 10/20/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation
import Navigation

enum WeatherAppScreen: NavigationScreen {
    case home
    case locationWeather(location: String)
    case search
    case settings
}
