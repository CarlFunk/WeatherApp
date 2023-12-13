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
        return AnyView(navigation.screen.view(coordinator))
    }
}
