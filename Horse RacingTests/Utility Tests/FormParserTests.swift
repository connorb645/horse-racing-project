//
//  FormParserTests.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import XCTest
@testable import Horse_Racing

class FormParserTests: XCTestCase {

    func testCanParseSingleRaceForm() {
        let formParser = FormParser()
        
        let tests: [(input: String, expected: [Int])] = [("1", [1]), ("2", [2]), ("3", [3]), ("4", [4])]
        
        tests.forEach { test in
            let form: Form = formParser.parse(test.input)
            
            XCTAssertEqual(form.raceResults, test.expected)
        }
    }
    
    func testCanParseMultipleRaceForm() {
        let formParser = FormParser()
        
        let tests : [(input: String, expected: [Int])] = [("11", [1,1]), ("10", [1,0]), ("22", [2,2])]
        
        tests.forEach { test in
            let form: Form = formParser.parse(test.input)
            
            XCTAssertEqual(form.raceResults, test.expected)
        }
    }
    
    func testCountsDashAsZero() {
        let formParser = FormParser()
        
        let tests: [(input: String, expected: [Int])] = [("-", [0]), ("-1-", [0,1,0])]
        
        tests.forEach { test in
            let form: Form = formParser.parse(test.input)
            XCTAssertEqual(form.raceResults, test.expected)
        }
    }
}

