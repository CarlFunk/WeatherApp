//
//  WeatherSettingsTile.swift
//  UI
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Domain
import SwiftUI
import UseCases

public struct WeatherSettingsTile: View, ActionableView {
    public enum Action {
        case viewPressureSettings
        case viewTemperatureSettings
        case viewWindSpeedSettings
    }
    
    @State private var settings: Settings = .mock()
    
    public let action: ActionClosure
    
    public init(
        action: @escaping ActionClosure
    ) {
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: BrandTheme.Spacing.none) {
            pressureOption()
            divider()
            temperatureOption()
            divider()
            windSpeedOption()
        }
        .redacted(when: settings.isMock)
        .disabled(settings.isMock)
        .task(loadSettingsData)
    }
    
    private func divider() -> some View {
        BrandDivider()
            .padding(.horizontal, BrandTheme.Spacing.standard)
    }
    
    private func pressureOption() -> some View {
        ActionRow(
            label: "Pressure",
            value: settings.pressureUnit.abbreviation
        ) { rowAction in
            switch rowAction {
            case .takeAction:
                action(.viewPressureSettings)
            }
        }
    }
    
    private func temperatureOption() -> some View {
        ActionRow(
            label: "Temperature",
            value: settings.temperatureUnit.name
        ) { rowAction in
            switch rowAction {
            case .takeAction:
                action(.viewTemperatureSettings)
            }
        }
    }
    
    private func windSpeedOption() -> some View {
        ActionRow(
            label: "Wind Speed",
            value: settings.windSpeedUnit.abbreviation
        ) { rowAction in
            switch rowAction {
            case .takeAction:
                action(.viewWindSpeedSettings)
            }
        }
    }
    
    @Sendable
    private func loadSettingsData() async {
        let settingsStream = GetSettingsSubscriptionUseCase.run()
        for await settings in settingsStream {
            self.settings = settings
        }
    }
}

struct SettingsOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            WeatherSettingsTile(action: { _ in })
                .background(BrandTheme.Color.Background.primary)
                .previewLayout(.sizeThatFits)
        }
    }
}
