//
//  SelectionRows.swift
//  UI
//
//  Created by Carl Funk on 12/9/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import SettingsDomain
import SwiftUI

public struct SelectionRows<Option: SelectionOption>: View {
    @Binding var selectionGroup: SelectionGroup<Option>
    
    public init(
        selectionGroup: Binding<SelectionGroup<Option>>
    ) {
        self._selectionGroup = selectionGroup
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
            
            ForEach(selectionGroup.options) { option in
                VStack(spacing: BrandTheme.Spacing.none) {
                    SelectionRow(
                        option: option,
                        isSelected: selectionGroup.selections.contains(option))
                    
                    BrandDivider()
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectionGroup.set(option)
                }
            }
        }
    }
}

struct SelectionRows_Previews: PreviewProvider {
    @State static var selectionGroup = SelectionGroup<DefaultSelectionOption>.mock()
    
    static var previews: some View {
        SelectionRows(selectionGroup: $selectionGroup)
            .previewLayout(.sizeThatFits)
    }
}
