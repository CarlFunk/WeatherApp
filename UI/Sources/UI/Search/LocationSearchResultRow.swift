//
//  LocationSearchResultRow.swift
//  UI
//
//  Created by Carl Funk on 3/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import UseCases
import WeatherDomain

public struct LocationSearchResultRow: View, NavigatableView {
    public enum NavigationRequest {
        case viewLocation(WeatherLocation)
    }
    
    @Binding public var result: SearchLocation
    public let navigationRequest: NavigationRequestClosure
    
    public init(
        result: Binding<SearchLocation>,
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
            navigationRequest(.viewLocation(result.location))
        } label: {
            VStack(
                alignment: .leading,
                spacing: BrandTheme.Spacing.none
            ) {
                Text(result.location.name)
                    .font(.brand(style: .medium, size: 14))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                
                Text(result.location.region)
                    .font(.brand(style: .regular, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                
                Text(result.location.country)
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
                result = try await ToggleFavoriteLocationUseCase.run(searchLocation: result)
            }
        } label: {
            Image(.system(.favorite))
                .font(.body)
                .symbolVariant(result.location.isFavorite ? .fill : .none)
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
