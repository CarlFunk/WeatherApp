//
//  MockSettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine

public final class MockSettingsRepository: SettingsRepository {
    private let settingsPublisher: CurrentValueSubject<Settings, Never>
    private let homeLocationPublisher: CurrentValueSubject<LocationQuery, Never>
    
    public init(
        settings: Settings = .mock(id: "1"),
        homeLocation: LocationQuery = .mock()
    ) {
        self.settingsPublisher = .init(settings)
        self.homeLocationPublisher = .init(homeLocation)
    }
    
    public func getSettingsSubscription() -> AnyPublisher<Settings, Never> {
        settingsPublisher
            .eraseToAnyPublisher()
    }
    
    public func getHomeLocationSubscription() -> AnyPublisher<LocationQuery, Never> {
        homeLocationPublisher
            .eraseToAnyPublisher()
    }
    
    public func getSettings() async throws -> Settings {
        settingsPublisher.value
    }
    
    public func getHomeLocation() async throws -> LocationQuery {
        homeLocationPublisher.value
    }
    
    public func setSettings(_ settings: Settings) async throws {
        settingsPublisher.send(settings)
    }
    
    public func setHomeLocation(_ location: WeatherLocation) async throws {
        homeLocationPublisher.send(location.query)
    }
}
