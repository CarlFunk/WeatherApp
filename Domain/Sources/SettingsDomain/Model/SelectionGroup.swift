//
//  SelectionGroup.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/11/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct SelectionGroup {
    public var mode: SelectionMode
    public var options: [any SelectionOption] {
        didSet(oldOptions) {
            switch mode {
            case .multi:
                // Do nothing, multi selection allowed
                break
            case .single:
                for option in oldOptions {
                    guard option.isSelected else {
                        continue
                    }
                    
                    guard let optionIndex = options.firstIndex(where: { $0.id == option.id }) else {
                        continue
                    }
                    
                    options[optionIndex].isSelected = false
                }
            }
        }
    }
    
    public func selections() -> [any SelectionOption] {
        options.filter { $0.isSelected }
    }
    
    public init(
        mode: SelectionMode,
        options: [any SelectionOption]
    ) {
        self.mode = mode
        self.options = options
    }
}

public extension SelectionGroup {
    static func mock() -> SelectionGroup {
        SelectionGroup(
            mode: .single,
            options: SelectionOptions.mock())
    }
}
