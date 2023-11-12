//
//  IceView.swift
//  UI
//
//  Created by Carl Funk on 4/12/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct IceView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    private let width: CGFloat
    private let height: CGFloat
    
    public init(
        width: CGFloat = 32,
        height: CGFloat = 32
    ) {
        self.width = width
        self.height = height
    }
    
    public init(size: CGSize) {
        self.init(width: size.width, height: size.height)
    }
    
    public var body: some View {
        color
            .frame(width: width, height: height)
            .mask {
                Image(systemName: "rhombus.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    
            }
    }
    
    private var color: Color {
        if colorScheme.isLight {
            return BrandTheme.Color.darkCloudGradient
        } else {
            return BrandTheme.Color.lightCloudGradient
        }
    }
}

struct IceView_Previews: PreviewProvider {
    private static var size: CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    static var previews: some View {
        IceView(size: size)
            .frame(
                width: size.width * 2,
                height: size.height * 2)
            .previewLayout(.sizeThatFits)
    }
}
