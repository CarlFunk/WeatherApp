//
//  DefaultSelectionOption.swift
//  UI
//
//  Created by Carl Funk on 11/24/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public struct DefaultSelectionOption: SelectionOption {
    public var id: String
    public var selectionValue: String
    
    public init(
        id: String,
        selectionValue: String
    ) {
        self.id = id
        self.selectionValue = selectionValue
    }
}

extension DefaultSelectionOption {
    public static func mock(id: String) -> DefaultSelectionOption {
        DefaultSelectionOption(
            id: id,
            selectionValue: "Option \(id)")
    }
}

public extension SelectionGroup where Option == DefaultSelectionOption {
    static func mock() -> SelectionGroup {
        let options = SelectionOptions<DefaultSelectionOption>.mock()
        let selection = options.first
        
        return SelectionGroup(
            mode: .single,
            options: options,
            selections: selection.isNonNil ? [selection!] : [])
    }
}

public extension SelectionOptions where Element == DefaultSelectionOption {
    static func mock() -> SelectionOptions {
        [
            .mock(id: "1"),
            .mock(id: "2"),
            .mock(id: "3"),
            .mock(id: "4"),
            .mock(id: "5")
        ]
    }
}
