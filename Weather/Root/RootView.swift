//
//  RootView.swift
//  Weather
//
//  Created by Carl Funk on 2/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Navigation
import SwiftUI
import UI

struct RootView: View {
    private enum Option {
        case home
        case favorites
        case settings
    }
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @StateObject private var coordinator = NavigationCoordinator<WeatherAppScreen>()
    @State private var selected = WeatherAppScreen.home
    
    var body: some View {
        if horizontalSizeClass == .regular {
            columnRootView
        } else {
            tabRootView
        }
    }
    
    private var tabRootView: some View {
        TabView {
            homeTab
            searchTab
            settingsTab
        }
        .accentColor(BrandTheme.Color.Action.primary)
        .statusBar(hidden: true)
    }
    
    private var columnRootView: some View {
        NavigationSplitView {
            NavigationStack {
                sideBar
            }
        } detail: {
            DeveloperManagedNavigationCoordinatorView(coordinator: coordinator) { coordinator in
                ApplicationRouterView(
                    navigation: Navigation(screen: selected),
                    coordinator: coordinator)
            } screenView: { navigation, coordinator in
                ApplicationRouterView(
                    navigation: navigation,
                    coordinator: coordinator)
            }
        }
        .navigationSplitViewStyle(.prominentDetail)
        .accentColor(BrandTheme.Color.Action.primary)
        .statusBar(hidden: true)
    }
    
    private var homeTab: some View {
        ManagedNavigationCoordinatorView { coordinator in
            ApplicationRouterView(
                navigation: Navigation(screen: .home),
                coordinator: coordinator)
        } screenView: { navigation, coordinator in
            ApplicationRouterView(
                navigation: navigation,
                coordinator: coordinator)
        }
        .tabItem {
            Label("", systemImage: "house")
                .environment(\.symbolVariants, .none)
        }
    }
    
    private var searchTab: some View {
        ManagedNavigationCoordinatorView { coordinator in
            ApplicationRouterView(
                navigation: Navigation(screen: .search),
                coordinator: coordinator)
        } screenView: { navigation, coordinator in
            ApplicationRouterView(
                navigation: navigation,
                coordinator: coordinator)
        }
        .tabItem {
            Label("", systemImage: "heart")
                .environment(\.symbolVariants, .none)
        }
    }
    
    private var settingsTab: some View {
        ManagedNavigationCoordinatorView { coordinator in
            ApplicationRouterView(
                navigation: Navigation(screen: .settings),
                coordinator: coordinator)
        } screenView: { navigation, coordinator in
            ApplicationRouterView(
                navigation: navigation,
                coordinator: coordinator)
        }
        .tabItem {
            Label("", systemImage: "ruler")
                .environment(\.symbolVariants, .none)
        }
    }
    
    private var sideBar: some View {
        List {
            Button {
                selected = .home
            } label: {
                Label("Home", systemImage: "house")
                    .environment(\.symbolVariants, .none)
            }

            Button {
                selected = .search
            } label: {
                Label("Favorites", systemImage: "heart")
                    .environment(\.symbolVariants, .none)
            }
            
            Button {
                selected = .settings
            } label: {
                Label("Settings", systemImage: "ruler")
                    .environment(\.symbolVariants, .none)
            }
        }
        .listStyle(.sidebar)
    }
}

struct PhoneRootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
