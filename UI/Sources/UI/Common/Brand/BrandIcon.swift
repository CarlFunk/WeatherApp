//
//  BrandIcon.swift
//  UI
//
//  Created by Carl Funk on 4/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public enum BrandIcon {
    case system(BrandSystemIcon)
    case brand(BrandUniqueIcon)
}

public enum BrandSystemIcon: String {
    case favorite = "heart"
    case checkmark = "checkmark"
    case chevronLeft = "chevron.left"
    case chevronRight = "chevron.right"
    case close = "xmark"
    case home = "house"
    case humidity = "drop"
    case location = "location"
    case pressure = "info"
    case search = "magnifyingglass"
    case windSpeed = "wind"
}

public enum BrandUniqueIcon: String {
    case none = ""
}

public extension Image {
    init(_ brandIcon: BrandIcon) {
        switch brandIcon {
        case .system(let brandSystemIcon):
            self.init(systemName: brandSystemIcon.rawValue)
        case .brand(let brandUniqueIcon):
            self.init(brandUniqueIcon.rawValue, bundle: .main)
        }
    }
}
