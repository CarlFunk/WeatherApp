//
//  PreviewView.swift
//  UI
//
//  Created by Carl Funk on 11/11/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import SwiftUI
import UseCases

public struct PreviewView<ViewToPreview: View>: View {
    private let content: () -> ViewToPreview
    
    public init(@ViewBuilder content: @escaping () -> ViewToPreview) {
        SetupDependenciesUseCase.run()
        
        self.content = content
    }
    
    public var body: some View {
        content()
    }
}
