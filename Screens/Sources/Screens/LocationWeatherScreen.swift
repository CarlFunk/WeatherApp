//
//  LocationWeatherScreen.swift
//  Screens
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SettingsDomain
import SwiftUI
import UI
import UseCases
import WeatherDomain

public struct LocationWeatherScreen: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @State private var settings: Settings = .mock()
    @State private var weather: Weather = .mock()
    
    private let location: String
    
    public init(
        location: String
    ) {
        self.location = location
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch horizontalSizeClass {
            case .regular:
                wideContent
            default:
                narrowContent
            }
        }
        .background(BrandTheme.Color.Background.primary)
        .navigationBarTitleDisplayMode(.inline)
        .redacted(when: weather == Weather.mock())
        .task(id: location, loadData)
        .task(id: location, loadSettingsData)
    }
    
    private var narrowContent: some View {
        VStack(alignment: .leading, spacing: .zero) {
            SummaryTile(location: location)

            DaylightForecastTile(location: location)
                .padding(.vertical, BrandTheme.Spacing.standard)

            todaySectionTitle

            HourlyForecastTile(location: location)
                .padding(.top, BrandTheme.Spacing.medium)
                .padding(.bottom, BrandTheme.Spacing.standard)

            DailyForecastTile(location: location, action: { _ in })
                .padding(.bottom, BrandTheme.Spacing.standard)
            
            if true {
                VStack(spacing: BrandTheme.Spacing.standard) {
                    favoriteButton
                    
                    if weather.location.isPrimary == false {
                        setAsHomeButton
                    }
                }
                .padding(.horizontal, BrandTheme.Spacing.standard)
                .padding(.vertical, BrandTheme.Spacing.standard)
                .padding(.bottom, BrandTheme.Spacing.xLarge)
            }
        }
    }
    
    private var wideContent: some View {
        Grid(alignment: .leading) {
            GridRow {
                SummaryTile(location: location)
                
                EmptyView()
            }
            
            GridRow {
                VStack {
                    todaySectionTitle
                    
                    HourlyForecastTile(location: location)
                }
            }
            .gridCellColumns(2)
            
            GridRow {
                
                DaylightForecastTile(location: location)
                    .padding(.horizontal, BrandTheme.Spacing.standard)
                
                DailyForecastTile(location: location, action: { _ in })
                    .padding(.bottom, BrandTheme.Spacing.standard)
                
            }
        }
    }
    
    private var todaySectionTitle: some View {
        Text("Today")
            .font(.brand(style: .bold, size: 14))
            .foregroundColor(BrandTheme.Color.Text.secondary)
            .padding(.horizontal, BrandTheme.Spacing.standard)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var favoriteButton: some View {
        Button {
            Task {
                weather = try await ToggleFavoriteLocationUseCase.run(weather: weather)
            }
        } label: {
            HStack {
                Image(.system(.favorite))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                    .symbolVariant(weather.location.isFavorite ? .fill : .none)
                
                Text(weather.location.isFavorite ? "Unfavorite" : "Favorite")
                    .font(.brand(style: .bold, size: 14))
                    .foregroundColor(BrandTheme.Color.Text.primary)
            }
            .padding(.vertical, BrandTheme.Spacing.small)
            .padding(.horizontal, BrandTheme.Spacing.standard)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(BrandTheme.Color.Text.primary.opacity(0.1))
                    .shadow(radius: 2)
            )
        }
    }
    
    private var setAsHomeButton: some View {
        Button{
            Task {
                weather = try await UpdateHomeLocationSettingUseCase.run(weather: weather)
            }
        } label: {
            HStack {
                Image(.system(.home))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                    .symbolVariant(weather.location.isPrimary ? .fill : .none)
                
                Text("Set as Home")
                    .font(.brand(style: .bold, size: 14))
                    .foregroundColor(BrandTheme.Color.Text.primary)
            }
            .padding(.vertical, BrandTheme.Spacing.small)
            .padding(.horizontal, BrandTheme.Spacing.standard)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(BrandTheme.Color.Text.primary.opacity(0.1))
                    .shadow(radius: 2)
            )
        }
    }
    
    @Sendable
    private func loadData() async {
        do {
            let weatherModel = try await GetCurrentWeatherForLocationUseCase.run(location: location)
            
            self.weather = weatherModel
        } catch {
            print(error)
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

struct LocationWeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            LocationWeatherScreen(location: WeatherLocation.standardQuery())
        }
    }
}
