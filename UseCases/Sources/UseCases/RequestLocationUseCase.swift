//
//  RequestLocationUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Dependency
import Domain

public final class RequestLocationUseCase {
    public enum UseCaseError: Error {
        case invalidPermission
    }
    
    @Dependency(PermissionRepository.self) private static var repository
    
    public static func run() async throws -> (latitude: Double, longitude: Double) {
        do {
            let location = try await repository.checkLocation()
            
            switch location {
            case .authorized:
                return (latitude: Double.zero, longitude: Double.zero)
            case .awaitingUserRequest:
                throw UseCaseError.invalidPermission
            case .denied:
                throw UseCaseError.invalidPermission
            case .restricted:
                throw UseCaseError.invalidPermission
            case .unknown:
                throw UseCaseError.invalidPermission
            }
        
        } catch {
            throw error
        }
    }
}
