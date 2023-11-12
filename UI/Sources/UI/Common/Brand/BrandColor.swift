//
//  BrandColor.swift
//  UI
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct BrandColor {
    public struct Action {
        public static let primary = Color("ActionPrimary", bundle: .module)
        public static let positive = Color("ActionPositive", bundle: .module)
        public static let destructive = Color("ActionDestructive", bundle: .module)
    }
    
    public struct Gradient {
        public static let primaryStart = Color("GradientPrimaryStart", bundle: .module)
        public static let primaryEnd = Color("GradientPrimaryEnd", bundle: .module)
    }
    
    public struct Background {
        public static let primary = Color("BackgroundPrimary", bundle: .module)
        public static let secondary = Color("BackgroundSecondary", bundle: .module)
        public static let tertiary = Color("BackgroundTertiary", bundle: .module)
    }
    
    public struct Text {
        public static let primary = Color("TextPrimary", bundle: .module)
        public static let secondary = Color("TextSecondary", bundle: .module)
    }
    
    
    
    public static let lightCloudGradient = Color(.displayP3, red: 248 / 255, green: 248 / 255, blue: 248 / 255, opacity: 1.0)
    public static let darkCloudGradient = Color(.displayP3, red: 33 / 255, green: 47 / 255, blue: 88 / 255, opacity: 1.0)
}
