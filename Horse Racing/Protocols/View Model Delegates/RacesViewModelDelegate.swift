//
//  RacesViewModelDelegate.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

/// Delegate to inform subscribers of noteworthy events made on the RacesViewModel
protocol RacesViewModelDelegate: AnyObject {
    func receivedStateChange(state: ViewState<Race>)
}
