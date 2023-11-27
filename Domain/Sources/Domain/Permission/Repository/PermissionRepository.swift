//
//  PermissionRepository.swift
//  PermissionDomain
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine

public protocol PermissionRepository {
    
    func checkLocation() async throws -> LocationPermission
    
    func requestLocation() async throws
    
    func locationPublisher() -> AnyPublisher<LocationPermission, Never>
}
