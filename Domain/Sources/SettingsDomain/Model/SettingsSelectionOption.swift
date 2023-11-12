//
//  SettingsSelectionOption.swift
//  SettingsDomain
//
//  Created by Carl Funk on 12/12/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public struct SettingsSelectionOption: SelectionOption {
    public var id: String
    public var name: String
    public var isSelected: Bool
    
    public init(
        id: String,
        name: String,
        isSelected: Bool
    ) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}
