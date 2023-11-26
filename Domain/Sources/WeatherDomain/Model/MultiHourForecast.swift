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
    func next24Hours() -> MultiHourForecast {
        self.filter { hourForecast in
            hourForecast.date >= .now && hourForecast.date < .now.addingTimeInterval(86400)
        }
    }
}

public extension MultiHourForecast {
    static func mock() -> MultiHourForecast {
        [
            .mock(date: .mock(addedHours: 0)),
            .mock(date: .mock(addedHours: 1)),
            .mock(date: .mock(addedHours: 2)),
            .mock(date: .mock(addedHours: 3)),
            .mock(date: .mock(addedHours: 4)),
            .mock(date: .mock(addedHours: 5)),
            .mock(date: .mock(addedHours: 6)),
            .mock(date: .mock(addedHours: 7)),
            .mock(date: .mock(addedHours: 8)),
            .mock(date: .mock(addedHours: 9)),
            .mock(date: .mock(addedHours: 10)),
            .mock(date: .mock(addedHours: 11)),
            .mock(date: .mock(addedHours: 12)),
            .mock(date: .mock(addedHours: 13)),
            .mock(date: .mock(addedHours: 14)),
            .mock(date: .mock(addedHours: 15)),
            .mock(date: .mock(addedHours: 16)),
            .mock(date: .mock(addedHours: 17)),
            .mock(date: .mock(addedHours: 18)),
            .mock(date: .mock(addedHours: 19)),
            .mock(date: .mock(addedHours: 20)),
            .mock(date: .mock(addedHours: 21)),
            .mock(date: .mock(addedHours: 22)),
            .mock(date: .mock(addedHours: 23))
        ]
    }
}
