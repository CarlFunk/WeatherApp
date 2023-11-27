//
//  MultiDayForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public typealias MultiDayForecast = [DayForecast]

public extension MultiDayForecast {
    var isMock: Bool {
        self == .mock()
    }
}

public extension MultiDayForecast {
    static func mock() -> MultiDayForecast {
        return [
            DayForecast.mock(date: .mock(addedDays: 0)),
            DayForecast.mock(date: .mock(addedDays: 1)),
            DayForecast.mock(date: .mock(addedDays: 2)),
            DayForecast.mock(date: .mock(addedDays: 3)),
            DayForecast.mock(date: .mock(addedDays: 4)),
            DayForecast.mock(date: .mock(addedDays: 5)),
            DayForecast.mock(date: .mock(addedDays: 6))
        ]
    }
}
