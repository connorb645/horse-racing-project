//
//  RacesViewModelState.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

enum RacesViewModelState: Equatable {
    case empty
    case successful(races: [Race])
    case failed(message: String)
    
    static func == (lhs: RacesViewModelState, rhs: RacesViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.successful(let lhsRaces), .successful(let rhsRaces)):
            return lhsRaces == rhsRaces
        case (.failed(let lhsMessage), .failed(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}
