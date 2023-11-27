//
//  MockPermissionRepository.swift
//  PermissionDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine

public final class MockPermissionRepository: PermissionRepository {
    
    public init() { }
    
    public func checkLocation() async throws -> LocationPermission {
        LocationPermission(from: .authorizedAlways)
    }
    
    public func requestLocation() async throws {
        return
    }
    
    public func locationPublisher() -> AnyPublisher<LocationPermission, Never> {
        Just<LocationPermission>(.authorized(state: .always))
            .eraseToAnyPublisher()
    }
    
}
