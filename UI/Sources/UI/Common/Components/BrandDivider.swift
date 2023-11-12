//
//  BrandDivider.swift
//  UI
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct BrandDivider: View {
    
    public init() { }
    
    public var body: some View {
        Divider()
            .background(BrandTheme.Color.Background.secondary)
    }
}

struct BrandDivider_Previews: PreviewProvider {
    static var previews: some View {
        BrandDivider()
    }
}
