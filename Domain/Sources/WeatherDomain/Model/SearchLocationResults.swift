//
//  SearchLocationResults.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public typealias SearchLocationResults = [SearchLocation]

public extension SearchLocationResults {
    static func mock() -> [SearchLocation] {
        [
            SearchLocation.mock(name: "Austin"),
            SearchLocation.mock(name: "Dallas"),
            SearchLocation.mock(name: "Fort Worth"),
            SearchLocation.mock(name: "Houston"),
            SearchLocation.mock(name: "San Antonio")
        ]
    }
}
