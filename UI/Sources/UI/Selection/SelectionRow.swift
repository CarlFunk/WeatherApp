//
//  SelectionRow.swift
//  UI
//
//  Created by Carl Funk on 12/11/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Domain
import SwiftUI

public struct SelectionRow<Option: SelectionOption>: View {
    public let option: Option
    public let isSelected: Bool
    
    public init(
        option: Option,
        isSelected: Bool
    ) {
        self.option = option
        self.isSelected = isSelected
    }
    
    public var body: some View {
        HStack(spacing: BrandTheme.Spacing.small) {
            Text(option.selectionValue)
                .font(.brand(style: .medium, size: 14))
                .foregroundColor(BrandTheme.Color.Text.primary)
            
            Spacer()
            
            Image(.system(.checkmark))
                .foregroundColor(BrandTheme.Color.Text.secondary)
                .opacity(isSelected ? 1 : 0)
        }
        .padding(BrandTheme.Spacing.standard)
    }
}

struct SelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectionRow(option: DefaultSelectionOption.mock(id: "1"), isSelected: true)
            .previewLayout(.sizeThatFits)
    }
}
