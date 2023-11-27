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
    case unknown
    
    public var isAuthorized: Bool {
        switch self {
        case .authorized:
            return true
        default:
            return false
        }
    }
    
    public var isUnknown: Bool {
        self == .unknown
    }
}

public extension LocationPermission {
    static func mock() -> LocationPermission {
        .authorized(state: .always)
    }
}
