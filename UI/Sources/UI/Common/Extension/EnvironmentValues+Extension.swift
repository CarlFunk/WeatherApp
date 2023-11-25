//
//  EnvironmentValues+Extension.swift
//  UI
//
//  Created by Carl Funk on 3/31/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public extension EnvironmentValues {
    var isSwiftUIPreview: Bool {
        get { self[SwiftUIPreviewKey.self] }
        set { }
    }
}
