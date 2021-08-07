//
//  RacesViewModelState.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

enum ViewState<T: Hashable>: Equatable {
    case empty
    case successful(items: [T])
    case failed(message: String)
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.successful(let lhsItems), .successful(let rhsItems)):
            return lhsItems == rhsItems
        case (.failed(let lhsMessage), .failed(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}
