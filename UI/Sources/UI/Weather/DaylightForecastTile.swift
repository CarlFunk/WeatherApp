//
//  DaylightForecastTile.swift
//  UI
//
//  Created by Carl Funk on 2/28/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import WeatherDomain
import UseCases

public struct DaylightForecastTile: View {
    @State private var dayForecast: DayForecast = .mock()
    
    private let height: CGFloat = 50
    private let lineWidth: CGFloat = 2
    private let lineGradientOpacity: CGFloat = 0.4
    
    private let location: String
    
    public init(
        location: String
    ) {
        self.location = location
    }
    
    public var body: some View {
        VStack(spacing: .zero) {
            sunriseView
                .padding(.leading, BrandTheme.Spacing.standard)
                .padding(.vertical, BrandTheme.Spacing.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                lineView
                
                sunsetView
                    .padding(.trailing, BrandTheme.Spacing.standard)
                    .padding(.vertical, BrandTheme.Spacing.medium)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .task(id: location, loadData)
    }
    
    private var lineView: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(
                    to: CGPoint(x: 0, y: 0))
                path.addCurve(
                    to: CGPoint(x: geometry.size.width, y: height),
                    control1: CGPoint(x: geometry.size.width * (1/3), y: height * (2/100)),
                    control2: CGPoint(x: geometry.size.width * (2/3), y: height * (98/100)))
            }
            .stroke(lineGradient, lineWidth: lineWidth)
            .offset(y: lineWidth / 2)
            .frame(height: height + lineWidth)
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
    }
    
    private var lineGradient: LinearGradient {
        LinearGradient(
            colors: [
                BrandTheme.Gradient.colors(for: .sunrise).first!.opacity(lineGradientOpacity),
                BrandTheme.Gradient.colors(for: .sunset).first!.opacity(lineGradientOpacity),
                BrandTheme.Gradient.colors(for: .primary).first!.opacity(lineGradientOpacity)
            ],
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    private var sunriseView: some View {
        HStack {
            Circle()
                .fill(BrandTheme.Gradient.sunrise)
                .frame(width: 20, height: 20)
                .shadow(color: BrandTheme.Gradient.colors(for: .sunrise).first!, radius: 4)
            
            Text(dayForecast.sunriseTime)
                .font(.brand(style: .medium, size: 12))
                .foregroundColor(BrandTheme.Color.Text.primary)
        }
    }
    
    private var sunsetView: some View {
        HStack {
            Text(dayForecast.sunsetTime)
                .font(.brand(style: .medium, size: 12))
                .foregroundColor(BrandTheme.Color.Text.primary)
            
            Circle()
                .fill(BrandTheme.Gradient.sunset)
                .frame(width: 20, height: 20)
                .shadow(color: BrandTheme.Gradient.colors(for: .sunset).first!, radius: 4)
        }
    }
    
    @Sendable
    private func loadData() async {
        do {
            let dayForecast = try await GetCurrentForecastForLocationUseCase.run(location: location)
            
            self.dayForecast = dayForecast
        } catch {
            print(error)
        }
    }
}

struct DaylightForecastTile_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            DaylightForecastTile(location: WeatherLocation.standardQuery())
                .background(BrandTheme.Color.Background.primary)
                .previewLayout(.sizeThatFits)
        }
    }
}
