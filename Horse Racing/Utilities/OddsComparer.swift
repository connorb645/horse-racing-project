//
//  OddsComparer.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

struct OddsComparer {
    func compare(_ odds1: Odds, _ odds2: Odds) -> OddsComparison {
        
        let probabilityOfOdds1 = Double(odds1.unit2) / Double(odds1.unit1 + odds1.unit2)
        let probabilityOfOdds2 = Double(odds2.unit2) / Double(odds2.unit1 + odds2.unit2)
        
        if probabilityOfOdds1 > probabilityOfOdds2 {
            return .odds1Better
        } else if probabilityOfOdds2 > probabilityOfOdds1 {
            return .odds2Better
        }
        
        return .equal
    }
}
