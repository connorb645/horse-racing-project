//
//  OddsParserHelper.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import XCTest
@testable import Horse_Racing

struct OddsParserHelper {
    func parseOddsFromString(odds: String) -> Odds {
        let oddsParser = OddsParser()
        
        let oddsString = odds
        
        guard let odds = oddsParser.parse(oddsString) else {
            XCTFail("Couldn't parse odds from string to valid Odds object.")
            fatalError()
        }
        return odds
    }
}
