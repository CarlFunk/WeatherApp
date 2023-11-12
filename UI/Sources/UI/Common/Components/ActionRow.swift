//
//  ActionRow.swift
//  UI
//
//  Created by Carl Funk on 12/11/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI

public struct ActionRow: View, ActionableView {
    public enum Action {
        case takeAction
    }
    
    public let label: String
    public let value: String
    public let action: ActionClosure
    
    public init(
        label: String,
        value: String,
        action: @escaping ActionClosure
    ) {
        self.label = label
        self.value = value
        self.action = action
    }
    
    public var body: some View {
        Button {
            action(.takeAction)
        } label: {
            buttonContent()
        }
        .buttonStyle(.plain)
    }
    
    private func buttonContent() -> some View {
        HStack(spacing: BrandTheme.Spacing.none) {
            Text(label)
                .font(.brand(style: .medium, size: 16))
                .foregroundColor(BrandTheme.Color.Text.primary)
            
            Spacer()
            
            Text(value)
                .font(.brand(style: .medium, size: 14))
                .foregroundColor(BrandTheme.Color.Text.secondary)
            
            Image(.system(.chevronRight))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(BrandTheme.Color.Text.primary)
                .frame(width: 10, height: 10)
                .padding(.leading, BrandTheme.Spacing.small)
        }
        .padding(BrandTheme.Spacing.standard)
        .contentShape(Rectangle())
    }
}

struct ActionRow_Previews: PreviewProvider {
    static var previews: some View {
        ActionRow(
            label: "Label",
            value: "Value",
            action: { _ in })
            .previewLayout(.sizeThatFits)
    }
}
