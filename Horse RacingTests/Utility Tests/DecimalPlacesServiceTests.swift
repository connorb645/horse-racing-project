//
//  DecimalPlacesServiceTests.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import XCTest
@testable import Horse_Racing

class DecimalPlacesServiceTests: XCTestCase {

    func testCanRoundDownToTwoDecimalPlaces() {
        let decimalPlacesService = DecimalPlacesService()
        
        let tests: [(input: Double, expected: Double)] = [(1.123, 1.12), (1.324, 1.32), (1.4524, 1.45), (1.2345632, 1.23)]
        
        tests.forEach { test in
            let actual = decimalPlacesService.roundTo2DecimalPlaces(test.input)
            XCTAssertEqual(actual, test.expected)
        }
    }
    
    func testCanRoundUpToTwoDecimalPlaces() {
        let decimalPlacesService = DecimalPlacesService()
        
        let tests: [(input: Double, expected: Double)] = [(1.125, 1.13), (1.326, 1.33), (1.4574, 1.46), (1.2355632, 1.24)]
        
        tests.forEach { test in
            let actual = decimalPlacesService.roundTo2DecimalPlaces(test.input)
            XCTAssertEqual(actual, test.expected)
        }
    }

}
