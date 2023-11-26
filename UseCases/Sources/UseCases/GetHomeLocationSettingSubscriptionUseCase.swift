//
//  GetHomeLocationSettingSubscriptionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import Foundation
import SettingsDomain
import WeatherDomain

public final class GetHomeLocationSettingSubscriptionUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run() -> AsyncStream<LocationQuery> {
        repository.getHomeLocationSubscription().asyncStream()
    }
}
