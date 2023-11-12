//
//  BrandGradient.swift
//  UI
//
//  Created by Carl Funk on 2/28/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct BrandGradient {
    public enum Defined {
        case primary
        case sunrise
        case sunset
    }
    
    public static let primary = LinearGradient(
        colors: colors(for: .primary),
        startPoint: .topLeading,
        endPoint: .trailing)
    
    public static let sunrise = LinearGradient(
        colors: colors(for: .sunrise),
        startPoint: .topLeading,
        endPoint: .trailing)
    
    public static let sunset = LinearGradient(
        colors: colors(for: .sunset),
        startPoint: .topLeading,
        endPoint: .trailing)
    
    private static let primaryColors: [Color] = [
        BrandColor.Gradient.primaryStart,
        BrandColor.Gradient.primaryEnd
    ]
    
    private static let sunriseColors: [Color] = [
        .orange,
        .red
    ]
    
    private static let sunsetColors: [Color] = [
        .white,
        .yellow
    ]
    
    public static func colors(for defined: Defined) -> [Color] {
        switch defined {
        case .primary:      return primaryColors
        case .sunrise:      return sunriseColors
        case .sunset:       return sunsetColors
        }
    }
}
