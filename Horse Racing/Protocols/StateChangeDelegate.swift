//
//  StateChangeDelegate.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import Foundation

protocol StateChangeDelegate: AnyObject {
    func stateChanged<T: Hashable>(to state: ViewState<T>)
}
