//
//  RainWeatherConditionView.swift
//  UI
//
//  Created by Carl Funk on 4/6/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct RainWeatherConditionView: View {
    @State private var isAnimating: Bool = false
    
    private let numberOfDrops = 11
    
    private let width: CGFloat
    private let height: CGFloat
    private let animationDuration: Double
    
    public init(
        width: CGFloat = 164,
        height: CGFloat = 164,
        animationDuration: Double = 1.0
    ) {
        self.width = width
        self.height = height
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
            ForEach(0..<numberOfDrops, id:\.self) { index in
                animatingRainDrop(
                    width: width * 0.1,
                    height: height * 0.1,
                    offsetX: offsetX(for: index),
                    animationHeight: height,
                    animationDuration: animationDuration)
            }
        }
        .frame(width: width, height: height)
        .onAppear {
            isAnimating = true
        }
        .onDisappear {
            isAnimating = false
        }
    }
    
    private func offsetX(for index: Int) -> CGFloat {
        let indexForCalculation = CGFloat(index)
        let numberOfDropsForCalculation = CGFloat(numberOfDrops - 1)
        
        return (-width / 2) +
            (width / CGFloat(numberOfDropsForCalculation) * CGFloat(indexForCalculation))
    }
    
    private func animatingRainDrop(
        width: CGFloat,
        height: CGFloat,
        offsetX: CGFloat,
        animationHeight: CGFloat,
        animationDuration: Double
    ) -> some View {
        RainDropView(
            width: width,
            height: height)
            .offset(
                x: offsetX,
                y: isAnimating ? animationHeight / 2 : -animationHeight / 2)
            .opacity(isAnimating ? 1 : 0)
            .animation(
                .easeIn(duration: animationDuration)
                    .repeatForever(autoreverses: false)
                    .delay(Double.random(in: 0.0...1.0)),
                value: isAnimating)
    }
}

struct RainWeatherConditionView_Previews: PreviewProvider {
    static var previews: some View {
        RainWeatherConditionView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
