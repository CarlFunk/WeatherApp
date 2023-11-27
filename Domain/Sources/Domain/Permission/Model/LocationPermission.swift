//
//  LocationPermission.swift
//  PermissionDomain
//
//  Created by Carl Funk on 1/1/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public enum LocationPermission: Equatable {
    case authorized(state: AuthorizedLocationPermissionState)
    case awaitingUserRequest
    case denied
    case restricted
    
    public var isAuthorized: Bool {
        switch self {
        case .authorized:
            return true
        default:
            return false
        }
    }
}

public extension LocationPermission {
    static func mock() -> LocationPermission {
        .authorized(state: .always)
    }
}
