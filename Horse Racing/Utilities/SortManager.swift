//
//  SortManager.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

struct SortManager {
    
    func sort(_ rides: [Ride], using sorter: Sorter) -> [Ride] {
        let sortedRides = rides.sorted { sorter.shouldFormerPreceed(ride1: $0, ride2: $1) }
        return sortedRides
    }
    
}
