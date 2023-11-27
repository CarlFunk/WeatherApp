//
//  LocationQuery.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public struct LocationQuery: Equatable, ExpressibleByStringLiteral, Hashable, Identifiable {
    public let value: String
    
    public init(value: String) {
        self.value = value
    }
    
    public init(stringLiteral value: String) {
        self.value = value
    }
    
    public var id: String {
        value
    }
    
    public static func generate(
        name: String,
        region: String,
        country: String
    ) -> LocationQuery {
        func separateAndCleanse(string: String) -> [String] {
            string
                .lowercased()
                .components(separatedBy: " ")
                .map { $0.trimmingCharacters(in: .punctuationCharacters) }
        }
        
        var strings = [String]()
        strings.append(contentsOf: separateAndCleanse(string: name))
        strings.append(contentsOf: separateAndCleanse(string: region))
        strings.append(contentsOf: separateAndCleanse(string: country))
        
        let value = strings
            .joined(separator: "-")
        
        return LocationQuery(value: value)
    }
}

public extension LocationQuery {
    static func `default`() -> LocationQuery {
        "dallas-texas-united-states-of-america"
    }
    
    static func mock() -> LocationQuery {
        "name-region-country"
    }
}
