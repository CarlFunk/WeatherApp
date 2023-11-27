//
//  LocationSearchResultRow.swift
//  UI
//
//  Created by Carl Funk on 3/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Domain
import SwiftUI
import UseCases

public struct LocationSearchResultRow: View, NavigatableView {
    public enum NavigationRequest {
        case viewLocation(WeatherLocation)
    }
    
    @Binding public var result: WeatherLocation
    public let navigationRequest: NavigationRequestClosure
    
    public init(
        result: Binding<WeatherLocation>,
        navigationRequest: @escaping NavigationRequestClosure
    ) {
        self._result = result
        self.navigationRequest = navigationRequest
    }
    
    public var body: some View {
        HStack(
            alignment: .center,
            spacing: BrandTheme.Spacing.small
        ) {
            locationSection()
            actionSection()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, BrandTheme.Spacing.standard)
    }
    
    private func locationSection() -> some View {
        Button {
            navigationRequest(.viewLocation(result))
        } label: {
            VStack(
                alignment: .leading,
                spacing: BrandTheme.Spacing.none
            ) {
                Text(result.name)
                    .font(.brand(style: .medium, size: 14))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                
                Text(result.region)
                    .font(.brand(style: .regular, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                
                Text(result.country)
                    .font(.brand(style: .regular, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
    }
    
    private func actionSection() -> some View {
        Button {
            Task {
                result = try await ToggleFavoriteLocationUseCase.run(weatherLocation: result)
            }
        } label: {
            Image(.system(.favorite))
                .font(.body)
                .symbolVariant(result.isFavorite ? .fill : .none)
        }
        .buttonStyle(.plain)
    }
}

struct LocationSearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            LocationSearchResultRow(
                result: .constant(.mock()),
                navigationRequest: { _ in })
        }
    }
}
