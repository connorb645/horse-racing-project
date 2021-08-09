//
//  OddsSorter.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

struct ClothNumberSorter: Sorter {
    func shouldFormerPreceed(ride1: Ride, ride2: Ride) -> Bool {
        return ride1.clothNumber <= ride2.clothNumber
    }
}
