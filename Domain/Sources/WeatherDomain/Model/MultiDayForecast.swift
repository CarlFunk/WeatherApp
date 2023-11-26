//
//  MultiDayForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public typealias MultiDayForecast = [DayForecast]

public extension MultiDayForecast {
    static func mock() -> MultiDayForecast {
        return [
            .mock(date: .mock(addedDays: 0)),
            .mock(date: .mock(addedDays: 1)),
            .mock(date: .mock(addedDays: 2)),
            .mock(date: .mock(addedDays: 3)),
            .mock(date: .mock(addedDays: 4)),
            .mock(date: .mock(addedDays: 5)),
            .mock(date: .mock(addedDays: 6))
        ]
    }
}
