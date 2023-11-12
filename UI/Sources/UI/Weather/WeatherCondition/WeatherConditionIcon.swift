//
//  WeatherConditionIcon.swift
//  UI
//
//  Created by Carl Funk on 3/26/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import WeatherDomain

public struct WeatherConditionIcon: View {
    public enum Style {
        case thin
        case filled
    }
    
    private let kind: WeatherCondition.Kind
    private let style: Style
    
    public init(condition: WeatherCondition, style: Style = .filled) {
        self.kind = condition.kind
        self.style = style
    }
    
    public init(kind: WeatherCondition.Kind, style: Style = .filled) {
        self.kind = kind
        self.style = style
    }
    
    public var body: some View {
        icon()
            .resizable()
            .aspectRatio(contentMode: .fit)
            .symbolVariant(iconVariant)
    }
    
    private func icon() -> Image {
        switch kind {
        case .blizzard,
             .blowingSnow:
            return Image(systemName: "wind.snow")
        case .clear:
            return Image(systemName: "circle")
        case .cloudy:
            return Image(systemName: "cloud")
        case .fog,
             .freezingFog,
             .mist:
            return Image(systemName: "cloud.fog")
        case .freezingDrizzle,
             .lightDrizzle,
             .lightFreezingRain,
             .lightRain,
             .patchyFreezingDrizzle,
             .patchyLightDrizzle,
             .patchyLightRain:
            return Image(systemName: "cloud.drizzle")
        case .freezingRain,
             .moderateRain,
             .patchyModerateRain,
             .patchyRain:
            return Image(systemName: "cloud.rain")
        case .heavyFreezingDrizzle,
             .heavyRain,
             .patchyHeavyRain:
            return Image(systemName: "cloud.heavyrain")
        case .heavyIce,
             .ice:
            return Image(systemName: "cloud.hail")
        case .heavySnow,
             .lightSnow,
             .moderateSnow,
             .patchyHeavySnow,
             .patchyLightSnow,
             .patchyModerateSnow,
             .patchySnow,
             .lightSnowAndStorm,
             .snowAndStorm:
            return Image(systemName: "cloud.snow")
        case .lightSleet,
             .sleet,
             .patchySleet:
            return Image(systemName: "cloud.sleet")
        case .lightRainAndStorm,
             .rainAndStorm:
            return Image(systemName: "cloud.bolt.rain")
        case .overcast,
             .partlyCloudy:
            return Image(systemName: "smoke")
        case .storm:
            return Image(systemName: "cloud.bolt")
        case .unknown:
            return Image(systemName: "circle")
        }
    }
    
    private var iconVariant: SymbolVariants {
        switch style {
        case .thin:     return .none
        case .filled:   return .fill
        }
    }
}

struct WeatherConditionIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherConditionIcon(kind: .blizzard, style: .thin)
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
