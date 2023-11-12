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

public struct SettingsSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var options: SelectionOptions
    
    public init(options: Binding<SelectionOptions>) {
        self._options = options
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            SelectionRows(options: $options)
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
        @State private var options = SelectionOptions.mock()
        
        var body: some View {
            SettingsSelectionScreen(
                options: $options)
        }
    }
    
    static var previews: some View {
        PreviewView {
            SettingsSelectionPreviewView()
        }
    }
}
