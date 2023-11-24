//
//  UpdateSettingsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import SettingsDomain

public final class UpdateSettingsUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run(settings: Settings) async throws {
        try await repository.setSettings(settings)
    }
}
