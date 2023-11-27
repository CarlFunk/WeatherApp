//
//  CheckLocationPermissionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 11/26/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Dependency
import Domain

public final class CheckLocationPermissionUseCase {
    @Dependency(PermissionRepository.self) private static var permissionRepository
    
    public static func run() async throws -> LocationPermission {
        try await permissionRepository.checkLocation()
    }
}
