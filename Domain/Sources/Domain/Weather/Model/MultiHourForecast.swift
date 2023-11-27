//
//  MultiHourForecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/25/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public typealias MultiHourForecast = [HourForecast]

public extension MultiHourForecast {
    var isMock: Bool {
        self == .mock()
    }
    
    func next24Hours() -> MultiHourForecast {
        self.filter { hourForecast in
            hourForecast.date >= .now && hourForecast.date < .now.addingTimeInterval(86400)
        }
    }
}

public extension MultiHourForecast {
    static func mock() -> MultiHourForecast {
        [
            HourForecast.mock(date: .mock(addedHours: 0)),
            HourForecast.mock(date: .mock(addedHours: 1)),
            HourForecast.mock(date: .mock(addedHours: 2)),
            HourForecast.mock(date: .mock(addedHours: 3)),
            HourForecast.mock(date: .mock(addedHours: 4)),
            HourForecast.mock(date: .mock(addedHours: 5)),
            HourForecast.mock(date: .mock(addedHours: 6)),
            HourForecast.mock(date: .mock(addedHours: 7)),
            HourForecast.mock(date: .mock(addedHours: 8)),
            HourForecast.mock(date: .mock(addedHours: 9)),
            HourForecast.mock(date: .mock(addedHours: 10)),
            HourForecast.mock(date: .mock(addedHours: 11)),
            HourForecast.mock(date: .mock(addedHours: 12)),
            HourForecast.mock(date: .mock(addedHours: 13)),
            HourForecast.mock(date: .mock(addedHours: 14)),
            HourForecast.mock(date: .mock(addedHours: 15)),
            HourForecast.mock(date: .mock(addedHours: 16)),
            HourForecast.mock(date: .mock(addedHours: 17)),
            HourForecast.mock(date: .mock(addedHours: 18)),
            HourForecast.mock(date: .mock(addedHours: 19)),
            HourForecast.mock(date: .mock(addedHours: 20)),
            HourForecast.mock(date: .mock(addedHours: 21)),
            HourForecast.mock(date: .mock(addedHours: 22)),
            HourForecast.mock(date: .mock(addedHours: 23))
        ]
    }
}
