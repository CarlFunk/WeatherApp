//
//  WeatherApp.swift
//  Weather
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import UI
import UseCases

@main
struct WeatherApp: App {
    init() {
        UITabBar.appearance().isOpaque = true
        UITabBar.appearance().barTintColor = UIColor(BrandTheme.Color.Background.primary)
        
        SetupDependenciesUseCase.run(environment: .live)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
