//
//  DefaultPermissionRepository.swift
//  PermissionDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Combine
import CoreLocation

public final class DefaultPermissionRepository: NSObject, PermissionRepository {
    
    private static let locationPermissionPublisher = PassthroughSubject<LocationPermission, Never>()
    
    private let locationManager: CLLocationManager
    private var location: CLLocation?
    
    public init(
        locationManager: CLLocationManager = CLLocationManager()
    ) {
        self.locationManager = locationManager
        super.init()
        
        self.locationManager.delegate = self
    }
    
    public func checkLocation() async throws -> LocationPermission {
        LocationPermission(from: locationManager.authorizationStatus)
    }
    
    public func requestLocation() async throws {
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func locationPublisher() -> AnyPublisher<LocationPermission, Never> {
        Publishers.Merge(
            DefaultPermissionRepository.locationPermissionPublisher,
            Future(asyncFunc: checkLocation)
                .replaceError(with: .denied)
        )
        .eraseToAnyPublisher()
    }
    
}

extension Future where Failure == Error {
    convenience init(asyncFunc: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do {
                    let result = try await asyncFunc()
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
}

extension DefaultPermissionRepository: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Do nothing
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationData = locations.first else {
            return
        }
        
        location = locationData
    }
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
