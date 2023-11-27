//
//  GetSettingsUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Domain

public final class GetSettingsUseCase {
    @Dependency(SettingsRepository.self) private static var repository
    
    public static func run() async throws -> Settings {
        try await repository.getSettings()
    }
}
