//
//  SettingsScreen.swift
//  Screens
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import PermissionDomain
import SettingsDomain
import SwiftUI
import UI
import UseCases
import WeatherDomain

public struct SettingsScreen: View {
    @State private var pressureSelectionGroup = SelectionGroup(mode: .single, options: [])
    @State private var temperatureSelectionGroup = SelectionGroup(mode: .single, options: [])
    @State private var windSpeedSelectionGroup = SelectionGroup(mode: .single, options: [])
    
    @State private var settings: Settings?
    @State private var settingsSelection: SettingsSelection?
    
    public init() { }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: .zero) {
                SettingsPreviewView()
                    .padding(.vertical, BrandTheme.Spacing.large)
                
                WeatherSettingsTile(
                    selectedPressureUnit: settings?.pressureUnit ?? .mock(),
                    selectedTemperatureUnit: settings?.temperatureUnit ?? .mock(),
                    selectedWindSpeedUnit: settings?.windSpeedUnit ?? .mock()
                ) { action in
                    switch action {
                    case .viewPressureSettings:
                        settingsSelection = .pressure
                    case .viewTemperatureSettings:
                        settingsSelection = .temperature
                    case .viewWindSpeedSettings:
                        settingsSelection = .windSpeed
                    }
                }
            }
        }
        .background(BrandTheme.Color.Background.primary)
        .navigationBarTitleDisplayMode(.inline)
        .task(loadSettings)
        .sheet(item: $settingsSelection) { settingsSelection in
            NavigationStack {
                switch settingsSelection {
                case .pressure:
                    SettingsSelectionScreen(options: $pressureSelectionGroup.options)
                case .temperature:
                    SettingsSelectionScreen(options: $temperatureSelectionGroup.options)
                case .windSpeed:
                    SettingsSelectionScreen(options: $windSpeedSelectionGroup.options)
                }
            }
            .presentationDetents([.fraction(0.3)])
        }
    }
    
    @Sendable
    private func loadSettings() async -> Void {
        do {
            let settings = try await GetSettingsUseCase.run()
            let settingsOptions = try await GetSettingSelectionOptionsUseCase().run(settings: settings)
            
            self.settings = settings
            self.pressureSelectionGroup.options = settingsOptions[.pressure] ?? []
            self.temperatureSelectionGroup.options = settingsOptions[.temperature] ?? []
            self.windSpeedSelectionGroup.options = settingsOptions[.windSpeed] ?? []
        } catch {
            
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            SettingsScreen()
        }
    }
}
