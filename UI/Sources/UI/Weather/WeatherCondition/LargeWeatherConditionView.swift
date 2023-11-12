//
//  LargeWeatherConditionView.swift
//  UI
//
//  Created by Carl Funk on 2/16/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import WeatherDomain

public struct LargeWeatherConditionView: View {
    private let width: CGFloat = 164
    private let height: CGFloat = 164
    
    public var timeOfDay: TimeOfDay
    public var weatherCondition: WeatherCondition.Kind
    
    public init(
        timeOfDay: TimeOfDay,
        weatherCondition: WeatherCondition.Kind
    ) {
        self.timeOfDay = timeOfDay
        self.weatherCondition = weatherCondition
    }
    
    public var body: some View {
        ZStack {
            view(for: weatherCondition, at: timeOfDay)
        }
        .frame(width: width, height: height)
    }
    
//    @ViewBuilder
//    private func view(for timeOfDay: TimeOfDay) -> some View {
//        switch timeOfDay {
//        case .morning, .afternoon:
//            Circle()
//                .fill(BrandTheme.Gradient.primary)
//                .shadow(color: BrandTheme.Color.Gradient.primaryStart, radius: 16)
//                .frame(width: width, height: height)
//        case .evening:
//            Circle()
//                .fill(BrandTheme.Gradient.primary)
//                .shadow(color: BrandTheme.Color.Gradient.primaryStart, radius: 16)
//                .frame(width: width, height: height)
//        }
//    }
    
    @ViewBuilder
    private func view(for weatherCondition: WeatherCondition.Kind, at timeOfDay: TimeOfDay) -> some View {
        switch weatherCondition {
        case .blizzard,
             .blowingSnow:
            IceWeatherConditionView(
                width: width,
                height: height,
                animationDuration: 0.65)
                .rotationEffect(.degrees(-55))
        case .clear:
            Circle()
                .fill(BrandTheme.Gradient.primary)
                .shadow(color: BrandTheme.Color.Gradient.primaryStart, radius: 16)
                .frame(width: width, height: height)
        case .cloudy,
             .overcast:
            ZStack {
                CloudView(
                    width: width * 0.8,
                    height: height * 0.8)
                
                CloudView(
                    width: width * 0.4,
                    height: height * 0.4)
                    .offset(
                        x: -width * 0.3,
                        y: -height * 0.3)
                
                CloudView(
                    width: width * 0.6,
                    height: height * 0.6)
                    .offset(
                        x: width * 0.3,
                        y: height * 0.2)
            }
        case .fog,
             .freezingFog,
             .mist:
            EmptyView()
        case .freezingDrizzle,
             .lightDrizzle,
             .lightFreezingRain,
             .lightRain,
             .patchyFreezingDrizzle,
             .patchyLightDrizzle,
             .patchyLightRain:
            RainWeatherConditionView(
                width: width,
                height: height,
                animationDuration: 1.0)
        case .freezingRain,
             .moderateRain,
             .patchyModerateRain,
             .patchyRain:
            RainWeatherConditionView(
                width: width,
                height: height,
                animationDuration: 0.85)
        case .heavyFreezingDrizzle,
             .heavyRain,
             .patchyHeavyRain:
            RainWeatherConditionView(
                width: width,
                height: height,
                animationDuration: 0.7)
        case .heavyIce,
             .ice:
            IceWeatherConditionView(
                width: width,
                height: height,
                animationDuration: 1)
                .rotationEffect(.degrees(-15))
        case .heavySnow,
             .lightSnow,
             .moderateSnow,
             .patchyHeavySnow,
             .patchyLightSnow,
             .patchyModerateSnow,
             .patchySnow,
             .lightSnowAndStorm,
             .snowAndStorm:
            SnowWeatherConditionView(
                width: width,
                height: height,
                animationDuration: 2.0)
        case .lightSleet,
             .sleet,
             .patchySleet:
            IceWeatherConditionView(
                width: width,
                height: height,
                numberOfIce: 4,
                animationDuration: 1)
                .rotationEffect(.degrees(-5))
        case .lightRainAndStorm,
             .rainAndStorm:
            EmptyView()
        case .partlyCloudy:
            ZStack {
                Circle()
                    .fill(BrandTheme.Gradient.primary)
                    .shadow(color: BrandTheme.Color.Gradient.primaryStart, radius: 16)
                    .frame(width: width, height: height)
                
                CloudView(
                    width: width * 0.5,
                    height: height * 0.5)
                    .offset(
                        x: -width * 0.3,
                        y: height * 0.2)
                
                CloudView(
                    width: width * 0.5,
                    height: height * 0.5)
                    .offset(
                        x: width * 0.1,
                        y: -height * 0.2)
            }
        case .storm:
            EmptyView()
        case .unknown:
            EmptyView()
        }
    }
}

struct LargeWeatherConditionView_Previews: PreviewProvider {
    static var previews: some View {
        LargeWeatherConditionView(timeOfDay: .evening, weatherCondition: .clear)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
