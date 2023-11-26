//
//  SettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Foundation
import WeatherDomain

public protocol SettingsRepository {
    func getSettingsSubscription() -> AnyPublisher<Settings, Never>
    func getHomeLocationSubscription() -> AnyPublisher<String, Never>
    
    func getSettings() async throws -> Settings
    func getHomeLocation() async throws -> String
    
    func setSettings(_ settings: Settings) async throws
    func setHomeLocation(_ location: WeatherLocation) async throws
}
