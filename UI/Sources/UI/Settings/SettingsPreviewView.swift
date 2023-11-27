//
//  SettingsPreviewView.swift
//  UI
//
//  Created by Carl Funk on 3/30/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Domain
import SwiftUI
import UseCases

public struct SettingsPreviewView: View {
    
    @State private var permission: LocationPermission = .unknown
    @State private var settings: Settings = .mock()
    @State private var weather: Weather = .mock()
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: BrandTheme.Spacing.standard) {
            switch permission {
            case .authorized:
                locationInUseIndicator
                
                VStack(spacing: BrandTheme.Spacing.none) {
                    location
                    country
                }
            case .awaitingUserRequest:
                enableLocationButton
                    .padding(.bottom, BrandTheme.Spacing.medium)
            case .denied, .restricted, .unknown:
                EmptyView()
            }
            
            VStack(spacing: BrandTheme.Spacing.medium) {
                LargeWeatherConditionView(timeOfDay: .evening, weatherCondition: weather.condition.kind)
                condition
            }
            
            temperature
            
            HStack(spacing: BrandTheme.Spacing.medium) {
                humidity
                pressure
                windSpeed
            }
            
            if permission.isAuthorized == false {
                locationNotInUseMessage
                    .padding(.horizontal, BrandTheme.Spacing.standard)
            }
        }
        .frame(maxWidth: .infinity)
        .redacted(when: settings.isMock || permission.isUnknown)
        .task(loadPermissionData)
        .task(loadSettingsData)
    }
    
    private var locationInUseIndicator: some View {
        HStack {
            Image(.system(.location))
                .font(.body)
                .foregroundColor(BrandTheme.Color.Text.secondary)
            
            Text("Your Location Now")
                .font(.brand(style: .medium, size: 14))
                .foregroundColor(BrandTheme.Color.Text.secondary)
        }
    }
    
    private var locationNotInUseMessage: some View {
        HStack(alignment: .firstTextBaseline, spacing: BrandTheme.Spacing.xSmall) {
            Text("*")
                .font(.brand(style: .medium, size: 10))
                .foregroundColor(BrandTheme.Color.Text.primary)
            
            Text("Location is currently not in use. Weather is not being shown for your location.")
                .font(.brand(style: .medium, size: 10))
                .foregroundColor(BrandTheme.Color.Text.primary)
                .multilineTextAlignment(.leading)
        }
    }
    
    private var enableLocationMessage: some View {
        Text("")
    }
    
    private var enableLocationButton: some View {
        Button {
            RequestLocationPermissionUseCase.run()
        } label: {
            Text("Enable my location")
                .font(.brand(style: .bold, size: 16))
                .foregroundColor(BrandTheme.Color.Action.positive)
                .padding(.vertical, BrandTheme.Spacing.small)
                .padding(.horizontal, BrandTheme.Spacing.medium)
                .background(
                    Capsule()
                        .fill(BrandTheme.Color.Action.positive.opacity(0.3)))
        }
    }
    
    private var location: some View {
        Text(weather.location.name)
            .font(.brand(style: .medium, size: 18))
            .foregroundColor(BrandTheme.Color.Text.primary)
            .multilineTextAlignment(.center)
    }
    
    private var country: some View {
        Text(weather.location.country)
            .font(.brand(style: .medium, size: 14))
            .foregroundColor(BrandTheme.Color.Text.secondary)
            .multilineTextAlignment(.center)
    }
    
    private var condition: some View {
        Text(weather.condition.text)
            .font(.brand(style: .medium, size: 14))
            .foregroundColor(BrandTheme.Color.Text.primary)
            .padding(.vertical, BrandTheme.Spacing.xSmall)
            .padding(.horizontal, BrandTheme.Spacing.medium)
            .background(
                Capsule()
                    .fill(BrandTheme.Color.Background.tertiary)
            )
    }
    
    private var temperature: some View {
        Text(weather.temperature.formatted(unit: settings.temperatureUnit, includeUnitAbbreviation: true))
            .font(.brand(style: .medium, size: 48))
            .foregroundColor(BrandTheme.Color.Text.primary)
    }
    
    private var humidity: some View {
        HStack {
            Image(.system(.humidity))
                .font(.body.bold())
                .foregroundColor(BrandTheme.Color.Text.secondary)
            
            Text(weather.humidity.formatted())
                .font(.brand(style: .medium, size: 12))
                .foregroundColor(BrandTheme.Color.Text.primary)
        }
    }
    
    private var pressure: some View {
        HStack {
            Image(.system(.pressure))
                .font(.body.bold())
                .foregroundColor(BrandTheme.Color.Text.secondary)
            
            Text(weather.pressure.formatted(unit: settings.pressureUnit, includeUnitAbbreviation: true))
                .font(.brand(style: .medium, size: 12))
                .foregroundColor(BrandTheme.Color.Text.primary)
        }
    }
    
    private var windSpeed: some View {
        HStack {
            Image(.system(.windSpeed))
                .font(.body.bold())
                .foregroundColor(BrandTheme.Color.Text.secondary)
            
            Text(weather.windSpeed.formatted(unit: settings.windSpeedUnit, includeUnitAbbreviation: true))
                .font(.brand(style: .medium, size: 12))
                .foregroundColor(BrandTheme.Color.Text.primary)
        }
    }
    
    @Sendable
    private func loadPermissionData() async {
        let permissionStream = GetLocationPermissionSubscriptionUseCase.run()
        for await permission in permissionStream {
            self.permission = permission
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

struct SettingsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            SettingsPreviewView()
                .padding(.vertical, BrandTheme.Spacing.standard)
                .background(BrandTheme.Color.Background.primary)
                .previewLayout(.sizeThatFits)
        }
    }
}
