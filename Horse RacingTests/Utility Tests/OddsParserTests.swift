//
//  OddsParserTests.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import XCTest
@testable import Horse_Racing

class OddsParserTests: XCTestCase {

    func testCanParseSimpleOddsFromString() {
        
        let oddsParser = OddsParser()
        
        typealias OddsAndResult = (odds: String, expected: Odds?)
        
        let tests: [OddsAndResult] = [("1/0", Odds(1, 0)), ("1/1", Odds(1, 1)), ("10/30", Odds(10, 30)), ("2/54", Odds(2, 54))]
            
        tests.forEach { test in
            let actualResult = oddsParser.parse(test.odds)
            XCTAssertEqual(actualResult?.unit1, test.expected?.unit1)
            XCTAssertEqual(actualResult?.unit2, test.expected?.unit2)
        }
    }
    
    func testReturnsNilWithInvalidInput() {
        
        let oddsParser = OddsParser()
        
        typealias OddsAndResult = (odds: String, expected: Odds?)
        
        let tests: [OddsAndResult] = [("1/0/2", nil), ("1 /2", nil), ("-2/-1", nil)]
            
        tests.forEach { test in
            let actualResult = oddsParser.parse(test.odds)
            XCTAssertEqual(actualResult?.unit1, test.expected?.unit1)
            XCTAssertEqual(actualResult?.unit2, test.expected?.unit2)
        }
    }

}
