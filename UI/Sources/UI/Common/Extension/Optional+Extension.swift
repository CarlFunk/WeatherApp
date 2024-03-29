//
//  Optional+Extension.swift
//  UI
//
//  Created by Carl Funk on 1/16/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

public extension Optional {
    var isNil: Bool {
        return self == nil
    }
    
    var isNonNil: Bool {
        return self != nil
    }
}
