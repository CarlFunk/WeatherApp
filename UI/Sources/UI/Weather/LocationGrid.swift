//
//  LocationGrid.swift
//  UI
//
//  Created by Carl Funk on 3/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import SettingsDomain
import SwiftUI
import UseCases
import WeatherDomain

public struct LocationGrid: View, NavigatableView {
    public enum NavigationRequest {
        case viewLocation(WeatherLocation)
    }
    
    @State private var weatherCollection: WeatherCollection = []
    @State private var settings: Settings = .mock()
    
    public let locations: [String]
    public let navigationRequest: NavigationRequestClosure
    
    public init(
        locations: [String],
        navigationRequest: @escaping NavigationRequestClosure
    ) {
        self.locations = locations
        self.navigationRequest = navigationRequest
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(
                columns: [
                    GridItem(spacing: BrandTheme.Spacing.medium),
                    GridItem(spacing: BrandTheme.Spacing.medium)
                ],
                alignment: .leading,
                spacing: BrandTheme.Spacing.medium
            ) {
                ForEach($weatherCollection, id:\.location.query) { weather in
                    LocationCard(weather: weather, settings: settings) { viewNavigationRequest in
                        switch viewNavigationRequest {
                        case .viewLocation(let location):
                            navigationRequest(.viewLocation(location))
                        }
                    }
                }
            }
            .padding(.top, BrandTheme.Spacing.small)
            .padding(.horizontal, BrandTheme.Spacing.standard)
            .animation(.spring(), value: weatherCollection.count)
        }
        .task(id: locations, loadData)
    }
    
    @Sendable
    private func loadData() async {
        do {
            let weatherCollection = try await GetCurrentWeatherForLocationsUseCase.run(locations: locations)
            self.weatherCollection = weatherCollection
        } catch {
            
        }
    }
}

struct FavoriteLocationListView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            LocationGrid(
                locations: [],
                navigationRequest: { _ in })
        }
    }
}
