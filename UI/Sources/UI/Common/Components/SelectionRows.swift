//
//  SelectionRows.swift
//  UI
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SettingsDomain
import SwiftUI

public struct SelectionRows: View {
    @Binding var options: SelectionOptions
    
    public init(
        options: Binding<SelectionOptions>
    ) {
        self._options = options
    }
    
    public var body: some View {
        LazyVGrid(
            columns: [
                GridItem()
            ],
            alignment: .leading,
            spacing: BrandTheme.Spacing.none
        ) {
            BrandDivider()
            
            ForEach($options, id:\.id) { option in
                VStack(spacing: BrandTheme.Spacing.none) {
                    SelectionRow(option: option.wrappedValue)
                    
                    BrandDivider()
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    option.isSelected.wrappedValue = !option.isSelected.wrappedValue
                }
            }
        }
    }
}

struct SelectionRows_Previews: PreviewProvider {
    @State static var options = SelectionOptions.mock()
    
    static var previews: some View {
        SelectionRows(options: $options)
            .previewLayout(.sizeThatFits)
    }
}
