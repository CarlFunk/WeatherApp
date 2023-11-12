//
//  View+Extension.swift
//  UI
//
//  Created by Carl Funk on 1/16/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import SwiftUI

public extension View {
    
    @ViewBuilder
    func hidden(when trueExpression: Bool) -> some View {
        if trueExpression {
            self.hidden()
        } else {
            self
        }
    }
    
    @ViewBuilder
    func redacted(when trueExpression: Bool) -> some View {
        if trueExpression {
            self.redacted(reason: .placeholder)
        } else {
            self
        }
    }
    
}
