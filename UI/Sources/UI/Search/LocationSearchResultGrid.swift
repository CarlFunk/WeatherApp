//
//  LocationSearchResultGrid.swift
//  UI
//
//  Created by Carl Funk on 3/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import UseCases
import WeatherDomain

public struct LocationSearchResultGrid: View, NavigatableView {
    public enum NavigationRequest {
        case viewLocation(WeatherLocation)
    }
    
    @Binding public var results: SearchLocationResults
    public let navigationRequest: NavigationRequestClosure
    
    public init(
        results: Binding<[WeatherLocation]>,
        navigationRequest: @escaping NavigationRequestClosure
    ) {
        self._results = results
        self.navigationRequest = navigationRequest
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(
                columns: [
                    GridItem(spacing: BrandTheme.Spacing.medium),
                ],
                alignment: .leading,
                spacing: BrandTheme.Spacing.medium
            ) {
                ForEach($results) { result in
                    LocationSearchResultRow(result: result) { viewNavigationRequest in
                        switch viewNavigationRequest {
                        case .viewLocation(let location):
                            navigationRequest(.viewLocation(location))
                        }
                    }
                    BrandDivider()
                }
            }
        }
        .background(BrandTheme.Color.Background.primary)
        .overlay {
            if results.isEmpty {
                LocationSearchEmptyResult()
            }
        }
    }
}

struct LocationSearchResultGrid_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            Group {
                LocationSearchResultGrid(
                    results: .constant(.mock()),
                    navigationRequest: { _ in })
                .previewDisplayName("Results State")
                
                LocationSearchResultGrid(
                    results: .constant([]),
                    navigationRequest: { _ in })
                .previewDisplayName("Empty State")
            }
        }
    }
}
