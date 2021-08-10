//
//  FormScoreCalculatorTests.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import XCTest
@testable import Horse_Racing

class FormScoreCalculatorTests: XCTestCase {

    func testCanCalculateSimpleFormScore() {
        let formScoreCalculator = FormScoreCalculator()
        let formParser = FormParser()
        
        let tests: [(input: String, expected: Double)] = [("1", 1.0), ("2", 2.0), ("3", 3.0)]
        
        tests.forEach { test in
            let form = formParser.parse(test.input)
            let score = formScoreCalculator.calculateScore(fromForm: form)
            
            XCTAssertEqual(score, test.expected)
        }
        
    }
    
    func testCanCalculateScoreWittMoreComplexInputs() {
        let formScoreCalculator = FormScoreCalculator()
        let formParser = FormParser()
        
        let tests: [(input: String, expected: Double)] = [("111", 1.0), ("22123", 2.0), ("321123", 2.0), ("6489214", 4.86)]
        
        tests.forEach { test in
            let form = formParser.parse(test.input)
            let score = formScoreCalculator.calculateScore(fromForm: form)
            
            XCTAssertEqual(score, test.expected)
        }
    }
    
    func testCorrectlyReplaceZeroWithTenWhilstScoring() {
        let formScoreCalculator = FormScoreCalculator()
        let formParser = FormParser()
        
        let tests: [(input: String, expected: Double)] = [("00-0", 10.0), ("010-", 7.75), ("20023", 5.4), ("2020", 6.0)]
        
        tests.forEach { test in
            let form = formParser.parse(test.input)
            let score = formScoreCalculator.calculateScore(fromForm: form)
            
            XCTAssertEqual(score, test.expected)
        }
    }

}
