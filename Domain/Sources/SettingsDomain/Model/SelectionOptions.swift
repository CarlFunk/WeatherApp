//
//  SelectionOptions.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/10/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public typealias SelectionOptions = [any SelectionOption]

public extension SelectionOptions {
    private struct MockSelectionOption: SelectionOption {
        var id: String
        var name: String
        var isSelected: Bool
        
        init(
            id: String,
            name: String,
            isSelected: Bool = false
        ) {
            self.id = id
            self.name = name
            self.isSelected = isSelected
        }
    }
    
    static func mock() -> SelectionOptions {
        [
            MockSelectionOption(id: "1", name: "Option 1", isSelected: true),
            MockSelectionOption(id: "2", name: "Option 2"),
            MockSelectionOption(id: "3", name: "Option 3"),
            MockSelectionOption(id: "4", name: "Option 4"),
            MockSelectionOption(id: "5", name: "Option 5")
        ]
    }
}
