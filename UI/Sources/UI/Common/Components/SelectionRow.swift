//
//  SelectionRow.swift
//  UI
//
//  Created by Carl Funk on 12/11/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SettingsDomain
import SwiftUI

public struct SelectionRow: View {
    public let option: any SelectionOption
    
    public init(
        option: any SelectionOption
    ) {
        self.option = option
    }
    
    public var body: some View {
        HStack(spacing: BrandTheme.Spacing.small) {
            Text(option.name)
                .font(.brand(style: .medium, size: 14))
                .foregroundColor(BrandTheme.Color.Text.primary)
            
            Spacer()
            
            Image(.system(.checkmark))
                .foregroundColor(BrandTheme.Color.Text.secondary)
                .opacity(option.isSelected ? 1 : 0)
        }
        .padding(BrandTheme.Spacing.standard)
    }
}

struct SelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectionRow(option: SelectionOptions.mock().first!)
            .previewLayout(.sizeThatFits)
    }
}
