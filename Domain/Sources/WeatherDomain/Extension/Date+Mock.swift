//
//  Date+Mock.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/26/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public extension Date {
    static func mock(addedDays: TimeInterval) -> Date {
        var date = Date.now
        var components = Calendar(identifier: .gregorian)
            .dateComponents(in: .current, from: date)
        components.hour = .zero
        components.minute = .zero
        components.second = .zero
        components.nanosecond = .zero
        
        if let updatedDate = components.date {
            date = updatedDate
        }
        
        let secondsInDay: TimeInterval = 86400
        return date.addingTimeInterval(addedDays * secondsInDay)
    }
    
    static func mock(addedHours: TimeInterval) -> Date {
        var date = Date.now
        var components = Calendar(identifier: .gregorian)
            .dateComponents(in: .current, from: date)
        components.hour = (components.hour ?? .zero) + ((components.minute ?? .zero) >= 30 ? 1 : 0)
        components.minute = .zero
        components.second = .zero
        components.nanosecond = .zero
        
        if let updatedDate = components.date {
            date = updatedDate
        }
        
        let secondsInHour: TimeInterval = 3600
        return date.addingTimeInterval(addedHours * secondsInHour)
    }
}
