//
//  Sorter.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

protocol Sorter {
    func shouldFormerPreceed(ride1: Ride, ride2: Ride) -> Bool
}
