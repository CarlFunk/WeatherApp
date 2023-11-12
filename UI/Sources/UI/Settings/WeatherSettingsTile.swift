//
//  WeatherSettingsTile.swift
//  UI
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import WeatherDomain

public struct WeatherSettingsTile: View, ActionableView {
    public enum Action {
        case viewPressureSettings
        case viewTemperatureSettings
        case viewWindSpeedSettings
    }
    
    public var selectedPressureUnit: PressureUnit
    public var selectedTemperatureUnit: TemperatureUnit
    public var selectedWindSpeedUnit: WindSpeedUnit
    public let action: ActionClosure
    
    public init(
        selectedPressureUnit: PressureUnit,
        selectedTemperatureUnit: TemperatureUnit,
        selectedWindSpeedUnit: WindSpeedUnit,
        action: @escaping ActionClosure
    ) {
        self.selectedPressureUnit = selectedPressureUnit
        self.selectedTemperatureUnit = selectedTemperatureUnit
        self.selectedWindSpeedUnit = selectedWindSpeedUnit
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
    }
    
    private func divider() -> some View {
        BrandDivider()
            .padding(.horizontal, BrandTheme.Spacing.standard)
    }
    
    private func pressureOption() -> some View {
        ActionRow(
            label: "Pressure",
            value: selectedPressureUnit.abbreviation
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
            value: selectedTemperatureUnit.name
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
            value: selectedWindSpeedUnit.abbreviation
        ) { rowAction in
            switch rowAction {
            case .takeAction:
                action(.viewWindSpeedSettings)
            }
        }
    }
}

struct SettingsOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            WeatherSettingsTile(
                selectedPressureUnit: .mock(),
                selectedTemperatureUnit: .mock(),
                selectedWindSpeedUnit: .mock(),
                action: { _ in })
            .background(BrandTheme.Color.Background.primary)
            .previewLayout(.sizeThatFits)
        }
    }
}
