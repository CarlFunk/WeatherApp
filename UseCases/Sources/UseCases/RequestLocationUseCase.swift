//
//  RequestLocationUseCase.swift
//  UseCases
//
//  Created by Carl Funk on 3/27/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import Dependency
import Foundation
import PermissionDomain

public final class RequestLocationUseCase {
    @Dependency(PermissionRepository.self) private static var repository
    
    public static func run() async throws -> (latitude: Double, longitude: Double) {
        do {
            let location = try await repository.checkLocation()
            
            switch location {
            case .authorized:
                return (latitude: Double.zero, longitude: Double.zero)
            case .awaitingUserRequest:
                throw NSError()
            case .denied:
                throw NSError()
            case .restricted:
                throw NSError()
            }
        
        } catch {
            throw error
        }
    }
}
