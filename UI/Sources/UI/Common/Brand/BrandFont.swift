//
//  BrandFont.swift
//  UI
//
//  Created by Carl Funk on 3/17/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public enum BrandFont {
    case light
    case regular
    case medium
    case bold
    case heavy
    
    public var name: String {
        switch self {
        case .light:    return "Avenir-Light"
        case .regular:  return "Avenir-Book"
        case .medium:   return "Avenir-Medium"
        case .bold:     return "Avenir-Heavy"
        case .heavy:    return "Avenir-Black"
        }
    }
}

public extension Font {
    static func brand(style: BrandFont, size: CGFloat) -> Font {
        return Font.custom(style.name, size: size)
    }
}
