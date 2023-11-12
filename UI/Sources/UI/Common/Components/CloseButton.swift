//
//  CloseButton.swift
//  UI
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct CloseButton: View, ActionableView {
    public enum Action {
        case closeTapped
    }
    
    public let action: ActionClosure
    
    public init(
        action: @escaping ActionClosure
    ) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action(.closeTapped)
        } label: {
            Image(.system(.close))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 14)
                .foregroundColor(BrandTheme.Color.Text.primary)
        }
        .buttonStyle(.plain)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton { _ in }
    }
}
