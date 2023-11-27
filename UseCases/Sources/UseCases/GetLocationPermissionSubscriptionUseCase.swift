//
//  GetLocationPermissionSubscriptionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 11/26/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Dependency
import Domain

public final class GetLocationPermissionSubscriptionUseCase {
    @Dependency(PermissionRepository.self) private static var permissionRepository
    
    public static func run() -> AsyncStream<LocationPermission> {
        permissionRepository.locationPublisher().asyncStream()
    }
}
