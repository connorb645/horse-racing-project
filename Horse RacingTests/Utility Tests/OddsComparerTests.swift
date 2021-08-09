//
//  OddsComparerTests.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import XCTest
@testable import Horse_Racing

class OddsComparerTests: XCTestCase {
    
    func testCanSuccessfullyCompareEqualOdds() {
        typealias OddsTest = (odd1: Odds, odd2: Odds)
        
        let oddsComparer = OddsComparer()
        
        let test1: OddsTest = (Odds(1, 0), Odds(1, 0))
        let test2: OddsTest = (Odds(1, 1), Odds(1, 1))
        
        let tests: [OddsTest] = [test1, test2]
        
        tests.forEach { test in
            let result: OddsComparison = oddsComparer.compare(test.odd1, test.odd2)
            XCTAssertEqual(result, .equal)
        }
    }
    
    func testCanSuccessfullyCompareOddsWhereUnitOneIsBetter() {
        typealias OddsTest = (odds: (odd1: Odds, odd2: Odds), expectedResult: OddsComparison)
        
        let oddsComparer = OddsComparer()
        
        let test1: OddsTest = ((Odds(6, 4), Odds(7, 2)), .odds1Better)
        let test2: OddsTest = ((Odds(7, 2), Odds(6, 4)), .odds2Better)
        let test3: OddsTest = ((Odds(5, 1), Odds(10, 1)), .odds1Better)
        
        let tests: [OddsTest] = [test1, test2, test3]
        
        tests.forEach { test in
            let result: OddsComparison = oddsComparer.compare(test.odds.odd1, test.odds.odd2)
            XCTAssertEqual(result, test.expectedResult)
        }
    }

}
