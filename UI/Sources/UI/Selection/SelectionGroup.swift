//
//  SelectionGroup.swift
//  UI
//
//  Created by Carl Funk on 12/11/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public struct SelectionGroup<Option: SelectionOption>: Equatable {
    public enum Mode {
        case single
        case multi
    }
    
    public var mode: Mode
    public var options: [Option]
    public var selections: [Option]
    
    public init(
        mode: Mode = .single,
        options: [Option] = [],
        selections: [Option] = []
    ) {
        self.mode = mode
        self.options = options
        self.selections = selections
    }
    
    public mutating func set(_ selection: Option) {
        switch mode {
        case .single:
            self.selections = [selection]
        case .multi:
            if selections.contains(selection) {
                self.selections.removeAll(where: { $0 == selection })
            } else {
                self.selections.append(selection)
            }
        }
    }
}
