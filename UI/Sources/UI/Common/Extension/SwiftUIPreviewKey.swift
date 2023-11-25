//
//  SwiftUIPreviewKey.swift
//  UI
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import SwiftUI

struct SwiftUIPreviewKey: EnvironmentKey {
    static let defaultValue: Bool = UIDevice.isSwiftUIPreview()
}
