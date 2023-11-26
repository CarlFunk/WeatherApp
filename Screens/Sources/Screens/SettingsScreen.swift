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
    public enum SettingsSelection: String, Equatable, Identifiable {
        case pressure
        case temperature
        case windSpeed
        
        public var id: String {
            rawValue
        }
    }
    
    @State private var pressureSelectionGroup = SelectionGroup<PressureUnit>()
    @State private var temperatureSelectionGroup = SelectionGroup<TemperatureUnit>()
    @State private var windSpeedSelectionGroup = SelectionGroup<WindSpeedUnit>()
    
    @State private var settings: Settings = .mock()
    @State private var settingsSelection: SettingsSelection?
    
    public init() { }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: .zero) {
                SettingsPreviewView()
                    .padding(.vertical, BrandTheme.Spacing.large)
                
                WeatherSettingsTile { action in
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
        .redacted(when: settings.isMock)
        .navigationBarTitleDisplayMode(.inline)
        .task(loadSettingsGroups)
        .task(loadSettingsData)
        .onChange(of: pressureSelectionGroup) { _ in
            updateSettings()
        }
        .onChange(of: temperatureSelectionGroup) { _ in
            updateSettings()
        }
        .onChange(of: windSpeedSelectionGroup) { _ in
            updateSettings()
        }
        .sheet(item: $settingsSelection) { settingsSelection in
            NavigationStack {
                switch settingsSelection {
                case .pressure:
                    SettingsSelectionScreen(
                        selectionGroup: $pressureSelectionGroup)
                case .temperature:
                    SettingsSelectionScreen(
                        selectionGroup: $temperatureSelectionGroup)
                case .windSpeed:
                    SettingsSelectionScreen(
                        selectionGroup: $windSpeedSelectionGroup)
                }
            }
            .presentationDetents([.fraction(0.3)])
        }
    }
    
    @Sendable
    private func loadSettingsGroups() async -> Void {
        do {
            let settings = try await GetSettingsUseCase.run()
            
            self.settings = settings
            self.pressureSelectionGroup = SelectionGroup(
                options: PressureUnit.allCases,
                selections: [settings.pressureUnit])
            self.temperatureSelectionGroup = SelectionGroup(
                options: TemperatureUnit.allCases,
                selections: [settings.temperatureUnit])
            self.windSpeedSelectionGroup = SelectionGroup(
                options: WindSpeedUnit.allCases,
                selections: [settings.windSpeedUnit])
        } catch {
            
        }
    }
    
    @Sendable
    private func loadSettingsData() async {
        let settingsStream = GetSettingsSubscriptionUseCase.run()
        for await settings in settingsStream {
            self.settings = settings
        }
    }
    
    private func updateSettings() {
        Task {
            var newSettings = settings
            if let selection = pressureSelectionGroup.selections.first {
                newSettings = newSettings.updated(properties: [\.pressureUnit: selection])
            }
            
            if let selection = temperatureSelectionGroup.selections.first {
                newSettings = newSettings.updated(properties: [\.temperatureUnit: selection])
            }
            
            if let selection = windSpeedSelectionGroup.selections.first {
                newSettings = newSettings.updated(properties: [\.windSpeedUnit: selection])
            }
            
            try? await UpdateSettingsUseCase.run(settings: newSettings)
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
