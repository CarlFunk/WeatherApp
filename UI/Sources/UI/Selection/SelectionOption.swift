//
//  SelectionOption.swift
//  UI
//
//  Created by Carl Funk on 3/20/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public protocol SelectionOption: Equatable, Hashable, Identifiable {
    var selectionValue: String { get }
}
