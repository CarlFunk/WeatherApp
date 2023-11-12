//
//  LocationPermission+Mapping.swift
//  PermissionDomain
//
//  Created by Carl Funk on 11/21/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import CoreLocation
import Foundation

extension LocationPermission {
    init(from status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            self = .awaitingUserRequest
        case .restricted:
            self = .restricted
        case .denied:
            self = .denied
        case .authorizedAlways:
            self = .authorized(state: .always)
        case .authorizedWhenInUse:
            self = .authorized(state: .duringAppLifecycle)
        case .authorized:
            self = .authorized(state: .provisional)
        @unknown default:
            self = .restricted
        }
    }
}
