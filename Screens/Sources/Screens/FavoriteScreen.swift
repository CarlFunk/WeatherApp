//
//  FavoriteScreen.swift
//  Screens
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import SwiftUI
import UI
import UseCases
import WeatherDomain

public struct FavoriteScreen: View, NavigatableView {
    
    public enum NavigationRequest {
        case viewLocation(id: String)
    }
    
    @FocusState private var focusSearch: Bool
    @State private var showSearch: Bool = false
    
    @State private var searchText: String = ""
    @State private var favoriteLocations: [String] = []
    @State private var searchResults: SearchLocationResults = []
    
    public let navigationRequest: NavigationRequestClosure
    
    public init(navigationRequest: @escaping NavigationRequestClosure) {
        self.navigationRequest = navigationRequest
    }
    
    public var body: some View {
        VStack(spacing: BrandTheme.Spacing.none) {
            searchBar
                .padding(.horizontal, BrandTheme.Spacing.standard)
                .padding(.vertical, BrandTheme.Spacing.medium)
            
            favoriteList
            
            .overlay {
                searchList
                    .opacity(showSearch ? 1 : 0)
                    .animation(.easeInOut, value: showSearch)
            }
        }
        .frame(maxWidth: .infinity)
        .background(BrandTheme.Color.Background.primary)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: focusSearch) { focusSearch in
            if focusSearch == false && searchText.isEmpty {
                showSearch = false
            }
        }
        .task(id: searchText, loadSearchResults)
        .task(streamFavoriteLocations)
    }
    
    private var searchBar: some View {
        HStack(spacing: BrandTheme.Spacing.medium) {
            Image(.system(.search))
                .foregroundColor(BrandTheme.Color.Text.secondary)
            
            searchTextField
            
            Image(systemName: "xmark.circle")
                .foregroundColor(BrandTheme.Color.Text.secondary)
                .opacity(searchText.isEmpty ? 0 : 1)
                .onTapGesture {
                    searchText = ""
                    searchResults = []
                    focusSearch = false
                    showSearch = false
                }
        }
    }
    
    private var searchTextField: some View {
        ZStack {
            Text("Search")
                .font(.brand(style: .medium, size: 16))
                .foregroundColor(BrandTheme.Color.Text.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(searchText.isEmpty && !focusSearch ? 1 : 0)
                .onTapGesture {
                    focusSearch = true
                    showSearch = true
                }
            
            TextField("", text: $searchText, prompt: nil)
                .font(.brand(style: .medium, size: 16))
                .foregroundColor(BrandTheme.Color.Text.primary)
                .opacity(searchText.isEmpty ? 0 : 1)
                .disableAutocorrection(true)
                .focused($focusSearch)
        }
    }
    
    private var searchList: some View {
        LocationSearchResultGrid(results: $searchResults) { viewNavigationRequest in
            switch viewNavigationRequest {
            case .viewLocation(let location):
                navigationRequest(.viewLocation(id: location.query.value))
            }
        }
    }
    
    @ViewBuilder
    private var favoriteList: some View {
        LocationGrid(locations: favoriteLocations) { viewNavigationRequest in
            switch viewNavigationRequest {
            case .viewLocation(let location):
                navigationRequest(.viewLocation(id: location.query.value))
            }
        }
    }
    
    @Sendable
    private func loadSearchResults() async {
        do {
            let locations = try await SearchForLocationsUseCase.run(search: searchText)
            searchResults = locations
        } catch {
            
        }
    }
    
    @Sendable
    private func streamFavoriteLocations() async {
        do {
            let favoriteLocationsStream = GetFavoriteLocationsSubscriptionUseCase.run()
            for await favoriteLocations in favoriteLocationsStream {
                self.favoriteLocations = favoriteLocations
            }
        } catch {
            
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            FavoriteScreen(navigationRequest: { _ in })
        }
    }
}
