//
//  RacesViewModelDelegate.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

protocol RacesViewModelDelegate: AnyObject {
    func receivedStateChange(state: ViewState<Race>)
}
