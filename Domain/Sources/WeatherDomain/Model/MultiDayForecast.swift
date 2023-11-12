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
            DayForecast.mock(date: "2022-01-01"),
            DayForecast.mock(date: "2022-01-02"),
            DayForecast.mock(date: "2022-01-03")
        ]
    }
}
