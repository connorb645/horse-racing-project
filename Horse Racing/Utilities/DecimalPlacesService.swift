//
//  DecimalPlacesService.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import Foundation

struct DecimalPlacesService {
    func roundTo2DecimalPlaces(_ toRound: Double) -> Double {
        return round(100 * toRound) / 100
    }
}
