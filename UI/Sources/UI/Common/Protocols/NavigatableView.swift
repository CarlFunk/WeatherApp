//
//  NavigatableView.swift
//  UI
//
//  Created by Carl Funk on 10/20/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Foundation

public protocol NavigatableView {
    typealias NavigationRequestClosure = ( (NavigationRequest) -> Void )
    
    associatedtype NavigationRequest
    
    var navigationRequest: NavigationRequestClosure { get }
}
