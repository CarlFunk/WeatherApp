//
//  WeatherCondition+Mapping.swift
//  WeatherDomain
//
//  Created by Carl Funk on 11/21/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Data

extension WeatherCondition {
    init(from response: ConditionInnerResponseModel) {
        switch response.code {
        case 1000:  self.kind = .clear // Also sunny
        case 1003:  self.kind = .partlyCloudy
        case 1006:  self.kind = .cloudy
        case 1009:  self.kind = .overcast
        case 1030:  self.kind = .mist
        case 1063:  self.kind = .patchyRain
        case 1066:  self.kind = .patchySnow
        case 1069:  self.kind = .patchySleet
        case 1072:  self.kind = .patchyFreezingDrizzle
        case 1087:  self.kind = .storm
        case 1114:  self.kind = .blowingSnow
        case 1117:  self.kind = .blizzard
        case 1135:  self.kind = .fog
        case 1147:  self.kind = .freezingFog
        case 1150:  self.kind = .patchyLightDrizzle
        case 1153:  self.kind = .lightDrizzle
        case 1168:  self.kind = .freezingDrizzle
        case 1171:  self.kind = .heavyFreezingDrizzle
        case 1180:  self.kind = .patchyLightRain
        case 1183:  self.kind = .lightRain
        case 1186:  self.kind = .patchyModerateRain
        case 1189:  self.kind = .moderateRain
        case 1192:  self.kind = .patchyHeavyRain
        case 1195:  self.kind = .heavyRain
        case 1198:  self.kind = .lightFreezingRain
        case 1201:  self.kind = .freezingRain
        case 1204:  self.kind = .lightSleet
        case 1207:  self.kind = .sleet
        case 1210:  self.kind = .patchyLightSnow
        case 1213:  self.kind = .lightSnow
        case 1216:  self.kind = .patchyModerateSnow
        case 1219:  self.kind = .moderateSnow
        case 1222:  self.kind = .patchyHeavySnow
        case 1225:  self.kind = .heavySnow
        case 1237:  self.kind = .ice
        case 1240:  self.kind = .lightRain
        case 1243:  self.kind = .moderateRain
        case 1246:  self.kind = .heavyRain
        case 1249:  self.kind = .lightSleet
        case 1252:  self.kind = .sleet
        case 1255:  self.kind = .lightSnow
        case 1258:  self.kind = .moderateSnow
        case 1261:  self.kind = .ice
        case 1264:  self.kind = .heavyIce
        case 1273:  self.kind = .lightRainAndStorm
        case 1276:  self.kind = .rainAndStorm
        case 1279:  self.kind = .lightSnowAndStorm
        case 1282:  self.kind = .snowAndStorm
        default:    self.kind = .unknown
        }
        
        self.text = response.text
    }
}
