//
//  WeatherCondition.swift
//  WeatherDomain
//
//  Created by Carl Funk on 2/16/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct WeatherCondition: Equatable {
    public enum Kind {
        case blizzard
        case blowingSnow
        case clear
        case cloudy
        case fog
        case freezingDrizzle
        case freezingFog
        case freezingRain
        case heavyFreezingDrizzle
        case heavyIce
        case heavyRain
        case heavySnow
        case ice
        case lightDrizzle
        case lightFreezingRain
        case lightRain
        case lightRainAndStorm
        case lightSleet
        case lightSnow
        case lightSnowAndStorm
        case mist
        case moderateRain
        case moderateSnow
        case overcast
        case partlyCloudy
        case patchyFreezingDrizzle
        case patchyHeavyRain
        case patchyHeavySnow
        case patchyLightDrizzle
        case patchyLightSnow
        case patchyLightRain
        case patchyModerateRain
        case patchyModerateSnow
        case patchyRain
        case patchySleet
        case patchySnow
        case rainAndStorm
        case sleet
        case snowAndStorm
        case storm
        case unknown
    }
    
    public var kind: Kind
    public var text: String
    
    public init(kind: Kind, text: String) {
        self.kind = kind
        self.text = text
    }
}

public extension WeatherCondition {
    static func mock() -> WeatherCondition {
        WeatherCondition(
            kind: .partlyCloudy,
            text: "Partly cloudy")
    }
}
