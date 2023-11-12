//
//  ColorScheme+Extension.swift
//  UI
//
//  Created by Carl Funk on 3/31/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public extension ColorScheme {
    var isLight: Bool {
        return self == .light
    }
    
    var isDark: Bool {
        return self == .dark
    }
}
