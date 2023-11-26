//
//  HourlyForecastTile.swift
//  UI
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SettingsDomain
import SwiftUI
import WeatherDomain
import UseCases

public struct HourlyForecastTile: View {
    @State private var hourForecasts: MultiHourForecast = .mock()
    @State private var scrollViewHeight: CGFloat = .zero
    @State private var settings: Settings = .mock()
    
    private let location: LocationQuery
    
    public init(
        location: LocationQuery
    ) {
        self.location = location
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: [
                    GridItem()
                ],
                spacing: BrandTheme.Spacing.standard
            ) {
                ForEach(hourForecasts.next24Hours()) { model in
                    forecastColumn(model: model)
                }
            }
            .padding(.horizontal, BrandTheme.Spacing.standard)
        }
        .frame(height: scrollViewHeight)
        .redacted(when: hourForecasts.isMock && settings.isMock)
        .task(id: location, loadData)
        .task(loadSettingsData)
    }
    
    @ViewBuilder
    private func forecastColumn(model: HourForecast) -> some View {
        VStack(spacing: BrandTheme.Spacing.medium) {
            Text(model.hourFormatted())
                .font(.brand(style: .medium, size: 12))
                .foregroundColor(BrandTheme.Color.Text.primary)
            
            BrandTheme.Gradient.primary
                .frame(width: 20, height: 20)
                .mask {
                    WeatherConditionIcon(condition: model.weatherCondition, style: .filled)
                        .frame(width: 20, height: 20)
                }
            
            Text(model.temperature.formatted(unit: settings.temperatureUnit, includeUnitAbbreviation: false))
                .font(.brand(style: .medium, size: 18))
                .foregroundColor(BrandTheme.Color.Text.primary)
        }
        .overlay(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        let columnHeight = geometry.size.height
                        if columnHeight > scrollViewHeight {
                            scrollViewHeight = columnHeight
                        }
                    }
            }
        )
    }
    
    @Sendable
    private func loadData() async {
        do {
            let hourForecastModels = try await GetTwentyFourHourForecastForDateUseCase.run(location: location)
            
            self.hourForecasts = hourForecastModels
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

struct HourlyForecastTile_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            HourlyForecastTile(location: .mock())
                .padding(.vertical)
                .frame(height: 150)
                .background(BrandTheme.Color.Background.primary)
                .previewLayout(.sizeThatFits)
        }
    }
}
