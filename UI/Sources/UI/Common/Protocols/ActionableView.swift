//
//  ActionableView.swift
//  UI
//
//  Created by Carl Funk on 12/5/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

public protocol ActionableView {
    typealias ActionClosure = ( (Action) -> Void )
    
    associatedtype Action
    
    var action: ActionClosure { get }
}
