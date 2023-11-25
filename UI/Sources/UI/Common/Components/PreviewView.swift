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
    private let closure: () -> Void
    private let content: () -> ViewToPreview
    
    public init(
        closure: @escaping () -> Void = { },
        @ViewBuilder content: @escaping () -> ViewToPreview
    ) {
        SetupDependenciesUseCase.run(environment: .mock)
        
        self.closure = closure
        self.content = content
        
        closure()
    }
    
    public var body: some View {
        content()
    }
}
