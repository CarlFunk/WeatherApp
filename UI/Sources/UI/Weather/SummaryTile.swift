//
//  SummaryTile.swift
//  UI
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SettingsDomain
import SwiftUI
import WeatherDomain
import UseCases

public struct SummaryTile: View {
    @State private var settings: Settings = .mock()
    @State private var weather: Weather = .mock()
    
    private let location: String
    
    public init(
        location: String
    ) {
        self.location = location
    }
    
    public var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading, spacing: .zero) {
                    Text(weather.location.name)
                        .font(.brand(style: .medium, size: 18))
                        .foregroundColor(BrandTheme.Color.Text.primary)
                    
                    Text(weather.temperature.formatted(unit: settings.temperatureUnit, includeUnitAbbreviation: true))
                        .font(.brand(style: .medium, size: 48))
                        .foregroundColor(BrandTheme.Color.Text.primary)
                    
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(BrandTheme.Spacing.standard)
                
                LargeWeatherConditionView(timeOfDay: .evening, weatherCondition: weather.condition.kind)
                    .offset(x: 64, y: -24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            detailsRow
                .padding(BrandTheme.Spacing.standard)
        }
        .frame(maxWidth: .infinity)
        .task(id: location, loadData)
    }
    
    private var detailsRow: some View {
        HStack {
            HStack {
                Image(.system(.humidity))
                    .font(.body.bold())
                    .foregroundColor(BrandTheme.Color.Text.secondary)
                
                Text(weather.humidity.formatted())
                    .font(.brand(style: .medium, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.primary)
            }
            
            Spacer()
            
            HStack {
                Image(.system(.pressure))
                    .font(.body.bold())
                    .foregroundColor(BrandTheme.Color.Text.secondary)
                
                Text(weather.pressure.formatted(unit: settings.pressureUnit, includeUnitAbbreviation: true))
                    .font(.brand(style: .medium, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.primary)
            }
            
            Spacer()
            
            HStack {
                Image(.system(.windSpeed))
                    .font(.body.bold())
                    .foregroundColor(BrandTheme.Color.Text.secondary)
                
                Text(weather.windSpeed.formatted(unit: settings.windSpeedUnit, includeUnitAbbreviation: true))
                    .font(.brand(style: .medium, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.primary)
            }
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
}

struct SummaryTile_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            SummaryTile(location: WeatherLocation.standardQuery())
                .background(BrandTheme.Color.Background.primary)
                .previewLayout(.sizeThatFits)
        }
    }
}
