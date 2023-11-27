//
//  LocationCard.swift
//  UI
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Domain
import SwiftUI
import UseCases

public struct LocationCard: View, NavigatableView {
    public enum NavigationRequest {
        case viewLocation(WeatherLocation)
    }
    
    @State private var settings: Settings = .mock()
    @State private var weather: Weather = .mock()
    
    public let location: LocationQuery
    public let navigationRequest: NavigationRequestClosure
    
    public init(
        location: LocationQuery,
        navigationRequest: @escaping NavigationRequestClosure
    ) {
        self.location = location
        self.navigationRequest = navigationRequest
    }
    
    public var body: some View {
        VStack(spacing: BrandTheme.Spacing.medium) {
            HStack(spacing: BrandTheme.Spacing.small) {
                temperature
                Spacer()
                condition
            }
            
            VStack(alignment: .leading, spacing: BrandTheme.Spacing.xSmall) {
                name
                country
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: BrandTheme.Spacing.small) {
                humidity
                windSpeed
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(BrandTheme.Spacing.medium)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(BrandTheme.Color.Background.secondary).shadow(radius: 4))
        .redacted(when: weather.isMock && settings.isMock)
        .onTapGesture {
            navigationRequest(.viewLocation(weather.location))
        }
        .contextMenu {
            VStack {
                Button {
                    Task {
                        self.weather = try await ToggleFavoriteLocationUseCase.run(weather: weather)
                    }
                } label: {
                    Text("Remove Favorite")
                        .font(.brand(style: .medium, size: 14))
                }
                
                Button {
                    Task {
                        weather = try await UpdateHomeLocationSettingUseCase.run(weather: weather)
                    }
                } label: {
                    Text("Set as Home")
                        .font(.brand(style: .medium, size: 14))
                }
            }
        }
        .task(id: location, loadData)
        .task(loadSettingsData)
    }
    
    private var temperature: some View {
        Text(weather.temperature.formatted(unit: settings.temperatureUnit, includeUnitAbbreviation: false))
            .font(.brand(style: .medium, size: 32))
            .foregroundColor(BrandTheme.Color.Text.primary)
    }
    
    private var condition: some View {
        BrandTheme.Gradient.primary
            .frame(width: 32, height: 32)
            .mask {
                WeatherConditionIcon(condition: weather.condition, style: .thin)
                    .frame(width: 32, height: 32)
            }
    }
    
    private var name: some View {
        Text(weather.location.name)
            .font(.brand(style: .medium, size: 14))
            .foregroundColor(BrandTheme.Color.Text.primary)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
    }
    
    private var country: some View {
        Text(weather.location.country)
            .font(.brand(style: .medium, size: 14))
            .foregroundColor(BrandTheme.Color.Text.secondary)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
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
    private func loadData() async {
        do {
            let weather = try await GetCurrentWeatherForLocationUseCase.run(location: location)
            self.weather = weather
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
}

struct FavoriteLocationView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            LocationCard(
                location: .mock(),
                navigationRequest: { _ in })
            .background(BrandTheme.Color.Background.primary)
            .previewLayout(.sizeThatFits)
        }
    }
}
