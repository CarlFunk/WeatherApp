//
//  DailyForecastTile.swift
//  UI
//
//  Created by Carl Funk on 2/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SettingsDomain
import SwiftUI
import WeatherDomain
import UseCases

public struct DailyForecastTile: View, ActionableView {
    public enum Action {
        case dayTapped(id: String)
    }
    
    @State private var settings: Settings = .mock()
    @State private var dayForecasts: MultiDayForecast = .mock()
    
    public let action: ActionClosure
    public let location: String
    
    public init(
        location: String,
        action: @escaping ActionClosure
    ) {
        self.location = location
        self.action = action
    }
    
    public var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), alignment: .leading),
                GridItem(.flexible(), alignment: .center),
                GridItem(.fixed(35), spacing: BrandTheme.Spacing.none, alignment: .trailing),
                GridItem(.fixed(35), alignment: .trailing)
            ],
            spacing: BrandTheme.Spacing.medium
        ) {
            ForEach(dayForecasts, id: \.date) { model in
                forecastRow(model: model)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, BrandTheme.Spacing.standard)
        .task(id: location, loadData)
        .task(loadSettingsData)
    }
    
    @ViewBuilder
    private func forecastRow(model: DayForecast) -> some View {
        Text(model.dayOfWeekFormatted() ?? "")
            .font(.brand(style: .regular, size: 14))
            .foregroundColor(BrandTheme.Color.Text.primary)
        
        BrandTheme.Gradient.primary
            .frame(width: 20, height: 20)
            .mask {
                WeatherConditionIcon(condition: model.weatherCondition, style: .filled)
                    .frame(width: 20, height: 20)
            }
        
        Text(model.highTemperature.formatted(unit: settings.temperatureUnit, includeUnitAbbreviation: false))
            .font(.brand(style: .bold, size: 14))
            .foregroundColor(BrandTheme.Color.Text.primary)
        
        Text(model.lowTemperature.formatted(unit: settings.temperatureUnit, includeUnitAbbreviation: false))
            .font(.brand(style: .bold, size: 14))
            .foregroundColor(BrandTheme.Color.Text.secondary)
    }
    
    @Sendable
    private func loadData() async {
        do {
            let dayForecastModels = try await GetSevenDayForecastUseCase.run(location: location)
            
            self.dayForecasts = dayForecastModels
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

struct DailyForecastTile_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            DailyForecastTile(
                location: LocationQuery.standardValue(),
                action: { _ in })
            .padding(.vertical)
            .background(BrandTheme.Color.Background.primary)
            .previewLayout(.sizeThatFits)
        }
    }
}
