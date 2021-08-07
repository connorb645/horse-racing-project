//
//  ModalContainerViewDelegate.swift
//  Horse Racing
//
//  Created on 03/08/2021.
//

import Foundation

/// Delegate to inform subscribers of noteworthy events made on the ModalContainerView
protocol ModalContainerViewDelegate: AnyObject {
    func dismissModal()
}
