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
    
    public static func run() {
        
        // MARK: - DataSource
        
        DependencyContainer.shared.register(
            type: FavoriteLocalDataSource.self,
            item: isPreviewEnvironment() ? MockFavoriteLocalDataSource() : DefaultFavoriteLocalDataSource() )
        DependencyContainer.shared.register(
            type: SettingsLocalDataSource.self,
            item: isPreviewEnvironment() ? MockSettingsLocalDataSource() : DefaultSettingsLocalDataSource())
        DependencyContainer.shared.register(
            type: RemoteWeatherDataSource.self,
            item: isPreviewEnvironment() ? MockRemoteWeatherDataSource() : DefaultRemoteWeatherDataSource())
        
        // MARK: - Repositories
        
        DependencyContainer.shared.register(
            type: FavoriteRepository.self,
            item: isPreviewEnvironment() ? MockFavoriteRepository() : DefaultFavoriteRepository())
        DependencyContainer.shared.register(
            type: PermissionRepository.self,
            item: isPreviewEnvironment() ? MockPermissionRepository() : DefaultPermissionRepository())
        DependencyContainer.shared.register(
            type: SettingsRepository.self,
            item: isPreviewEnvironment() ? MockSettingsRepository() : DefaultSettingsRepository())
        DependencyContainer.shared.register(
            type: WeatherRepository.self,
            item: isPreviewEnvironment() ? MockWeatherRepository() : DefaultWeatherRepository())
        
    }
    
    private static func isPreviewEnvironment() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
}
