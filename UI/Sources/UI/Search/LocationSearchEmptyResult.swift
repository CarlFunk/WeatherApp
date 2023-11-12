//
//  LocationSearchEmptyResult.swift
//  UI
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

struct LocationSearchEmptyResult: View {
    var body: some View {
        VStack(
            alignment: .center,
            spacing: BrandTheme.Spacing.medium
        ) {
            BrandTheme.Gradient.primary
                .frame(width: 48, height: 48)
                .mask {
                    Image(.system(.search))
                        .resizable()
                        .symbolVariant(.circle)
                        .symbolVariant(.fill)
                        .frame(width: 48, height: 48)
                }
            
            VStack(
                alignment: .center,
                spacing: BrandTheme.Spacing.none
            ) {
                Text("Hmm, no result yet")
                    .font(.brand(style: .medium, size: 14))
                    .foregroundColor(BrandTheme.Color.Text.primary)
                
                Text("Keep searching")
                    .font(.brand(style: .medium, size: 12))
                    .foregroundColor(BrandTheme.Color.Text.secondary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(.horizontal, BrandTheme.Spacing.standard)
    }
}

struct LocationSearchEmptyResult_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            LocationSearchEmptyResult()
        }
    }
}
