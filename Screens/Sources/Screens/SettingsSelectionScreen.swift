//
//  SettingsSelectionScreen.swift
//  Screens
//
//  Created by Carl Funk on 3/21/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import SwiftUI
import SettingsDomain
import UI
import WeatherDomain

public struct SettingsSelectionScreen<Option: SelectionOption>: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectionGroup: SelectionGroup<Option>
    
    public init(
        selectionGroup: Binding<SelectionGroup<Option>>
    ) {
        self._selectionGroup = selectionGroup
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            SelectionRows(selectionGroup: $selectionGroup)
        }
        .frame(maxWidth: .infinity)
        .background(BrandTheme.Color.Background.primary)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                CloseButton { viewAction in
                    switch viewAction {
                    case .closeTapped:
                        dismiss()
                    }
                }
            }
        }
    }
}

struct SelectionScreen_Previews: PreviewProvider {
    private struct SettingsSelectionPreviewView: View {
        @State private var selectionGroup = SelectionGroup<DefaultSelectionOption>.mock()
        
        var body: some View {
            SettingsSelectionScreen(selectionGroup: $selectionGroup)
        }
    }
    
    static var previews: some View {
        PreviewView {
            SettingsSelectionPreviewView()
        }
    }
}
