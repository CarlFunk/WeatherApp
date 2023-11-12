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
    @State private var settings: Settings = .mock()
    @State private var hourForecasts: [HourForecast] = []
    @State private var scrollViewHeight: CGFloat = 0
    
    private let location: String
    
    public init(
        location: String
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
                ForEach(hourForecasts, id: \.date) { model in
                    forecastColumn(model: model)
                }
            }
            .padding(.horizontal, BrandTheme.Spacing.standard)
        }
        .frame(height: scrollViewHeight)
        .task(id: location, loadData)
    }
    
    @ViewBuilder
    private func forecastColumn(model: HourForecast) -> some View {
        VStack(spacing: BrandTheme.Spacing.medium) {
            Text(model.timeFormatted(includeMinutes: false))
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
}

struct HourlyForecastTile_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            HourlyForecastTile(location: WeatherLocation.standardQuery())
                .padding(.vertical)
                .frame(height: 150)
                .background(BrandTheme.Color.Background.primary)
                .previewLayout(.sizeThatFits)
        }
    }
}
