//
//  GetSettingsSubscriptionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import SettingsDomain

public final class GetSettingsSubscriptionUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run() -> AsyncStream<Settings> {
        repository.getSettingsSubscription().asyncStream()
    }
}
