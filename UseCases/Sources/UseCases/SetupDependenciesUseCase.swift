//
//  SetupDependenciesUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import FavoriteData
import FavoriteDomain
import Foundation
import PermissionDomain
import SettingsData
import SettingsDomain
import WeatherData
import WeatherDomain

public final class SetupDependenciesUseCase {
    public enum Environment {
        case live
        case mock
    }
    
    public static func run(environment: Environment) {
        setupDataSourceDependencies(environment: environment)
        setupRepositoryDependencies(environment: environment)
    }
    
    private static func setupDataSourceDependencies(environment: Environment) {
        switch environment {
        case .live:
            DependencyContainer.shared.register(
                type: FavoriteLocalDataSource.self,
                item: DefaultFavoriteLocalDataSource())
            DependencyContainer.shared.register(
                type: SettingsLocalDataSource.self,
                item: DefaultSettingsLocalDataSource())
            DependencyContainer.shared.register(
                type: RemoteWeatherDataSource.self,
                item: DefaultRemoteWeatherDataSource())
        case .mock:
            DependencyContainer.shared.register(
                type: FavoriteLocalDataSource.self,
                item: MockFavoriteLocalDataSource())
            DependencyContainer.shared.register(
                type: SettingsLocalDataSource.self,
                item: MockSettingsLocalDataSource())
            DependencyContainer.shared.register(
                type: RemoteWeatherDataSource.self,
                item: MockRemoteWeatherDataSource())
        }
    }
    
    private static func setupRepositoryDependencies(environment: Environment) {
        switch environment {
        case .live:
            DependencyContainer.shared.register(
                type: FavoriteRepository.self,
                item: DefaultFavoriteRepository())
            DependencyContainer.shared.register(
                type: PermissionRepository.self,
                item: DefaultPermissionRepository())
            DependencyContainer.shared.register(
                type: SettingsRepository.self,
                item: DefaultSettingsRepository())
            DependencyContainer.shared.register(
                type: WeatherRepository.self,
                item: DefaultWeatherRepository())
        case .mock:
            DependencyContainer.shared.register(
                type: FavoriteRepository.self,
                item: MockFavoriteRepository())
            DependencyContainer.shared.register(
                type: PermissionRepository.self,
                item: MockPermissionRepository())
            DependencyContainer.shared.register(
                type: SettingsRepository.self,
                item: MockSettingsRepository())
            DependencyContainer.shared.register(
                type: WeatherRepository.self,
                item: MockWeatherRepository())
        }
    }
}
