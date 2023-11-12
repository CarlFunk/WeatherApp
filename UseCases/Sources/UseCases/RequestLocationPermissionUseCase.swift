//
//  RequestLocationPermissionUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Foundation
import PermissionDomain

public final class RequestLocationPermissionUseCase {
    @Dependency(PermissionRepository.self) private static var repository
    
    public static func run() {
        Task {
            try? await repository.requestLocation()
        }
    }
}
