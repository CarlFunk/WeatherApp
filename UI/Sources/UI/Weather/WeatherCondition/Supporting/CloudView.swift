//
//  CloudView.swift
//  UI
//
//  Created by Carl Funk on 4/6/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct CloudView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    private let width: CGFloat
    private let height: CGFloat
    
    public init(
        width: CGFloat = 64,
        height: CGFloat = 64
    ) {
        self.width = width
        self.height = height
    }
    
    public init(size: CGSize) {
        self.init(width: size.width, height: size.height)
    }
    
    public var body: some View {
        LinearGradient(
            stops: gradientStops,
            startPoint: .top,
            endPoint: .bottom)
            .mask(
                Image(systemName: "cloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit))
            .frame(width: width, height: height)
    }
    
    private var gradientStops: [Gradient.Stop] {
        if colorScheme.isLight {
            return [
                Gradient.Stop(color: BrandColor.darkCloudGradient.opacity(0.3), location: 0.2),
                Gradient.Stop(color: BrandColor.darkCloudGradient.opacity(0.8), location: 0.7)
            ]
        } else {
            return [
                Gradient.Stop(color: BrandColor.lightCloudGradient.opacity(0.3), location: 0.2),
                Gradient.Stop(color: BrandColor.lightCloudGradient.opacity(0.9), location: 0.7)
            ]
        }
    }
}

struct CloudView_Previews: PreviewProvider {
    static var previews: some View {
        CloudView()
            .background(BrandTheme.Color.Background.primary)
            .previewLayout(.sizeThatFits)
    }
}
