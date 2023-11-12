//
//  ClearWeatherConditionView.swift
//  UI
//
//  Created by Carl Funk on 4/12/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct ClearWeatherConditionView: View {
    @State private var isAnimating: Bool = false
    
    private let width: CGFloat
    private let height: CGFloat
    private let numberOfIce: Int
    private let animationDuration: Double
    
    public init(
        width: CGFloat = 164,
        height: CGFloat = 164,
        numberOfIce: Int = 11,
        animationDuration: Double = 2
    ) {
        self.width = width
        self.height = height
        self.numberOfIce = numberOfIce
        self.animationDuration = animationDuration
    }
    
    public init(size: CGSize, animationDuration: Double = 1.0) {
        self.init(
            width: size.width,
            height: size.height,
            animationDuration: animationDuration)
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(BrandTheme.Gradient.primary)
                .shadow(color: BrandTheme.Color.Gradient.primaryStart, radius: isAnimating ? 16 : 8)
                .frame(width: width, height: height)
                .animation(.easeInOut(duration: animationDuration).repeatForever(autoreverses: true), value: isAnimating)
        }
        .frame(width: width, height: height)
        .onAppear {
            isAnimating = true
        }
        .onDisappear {
            isAnimating = false
        }
    }
}

struct ClearWeatherConditionView_Previews: PreviewProvider {
    static var previews: some View {
        ClearWeatherConditionView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
