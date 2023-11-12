//
//  BrandSpacing.swift
//  UI
//
//  Created by Carl Funk on 2/15/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import UIKit
import SwiftUI

public struct BrandSpacing {
    public static let none: CGFloat     = 0
    public static let xSmall: CGFloat   = 4
    public static let small: CGFloat    = 8
    public static let medium: CGFloat   = 16
    public static let standard: CGFloat = 24
    public static let large: CGFloat    = 32
    public static let xLarge: CGFloat   = 48
}

extension CGFloat {
    public static var brandSpacing: BrandSpacing.Type {
        return BrandSpacing.self
    }
}
