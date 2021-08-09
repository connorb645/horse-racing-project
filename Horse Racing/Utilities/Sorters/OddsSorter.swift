//
//  OddsSorter.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

struct OddsSorter: Sorter {
    
    let oddsParser: OddsParser
    let oddsComparer: OddsComparer
    
    init(oddsParser: OddsParser, oddsComparer: OddsComparer) {
        self.oddsParser = oddsParser
        self.oddsComparer = oddsComparer
    }
    
    func shouldFormerPreceed(ride1: Ride, ride2: Ride) -> Bool {
        guard let odds1 = oddsParser.parse(ride1.currentOdds),
              let odds2 = oddsParser.parse(ride2.currentOdds) else {
            return false
        }
        
        let result = oddsComparer.compare(odds1, odds2)
        
        return result != .odds2Better
    }
}
