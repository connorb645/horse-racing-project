//
//  OddsParser.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

struct OddsParser {
    func parse(_ odds: String) -> Odds? {
        let units = odds.split(separator: "/")
        
        guard units.count == 2 else { return nil }
        
        guard let unit1 = Int(units[0]) else { return nil }
        guard let unit2 = Int(units[1]) else { return nil }
        
        guard unit1 >= 0 else { return nil }
        guard unit2 >= 0 else { return nil }
        
        return Odds(unit1, unit2)
    }
}
