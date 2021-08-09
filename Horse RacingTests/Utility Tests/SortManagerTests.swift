//
//  FilterManagerTests.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import XCTest
@testable import Horse_Racing

class SortManagerTests: XCTestCase {
    
    var rides: [Ride] {
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: JsonFileDecoder())
        let result: Result<[Race], DataFetcherError> = dataFetcher.fetchData()
        switch result {
        case .success(let races):
            return races.last?.rides ?? []
        default:
            fatalError("Failed to read data using FakeDataFetcher")
        }
    }

    func testCanSortByClothNumber() {
        let rides = rides
        
        XCTAssertEqual(rides.count, 4)
        
        let sortManager = SortManager()
        
        let sortedRides = sortManager.sort(rides, using: ClothNumberSorter())
        
        XCTAssertEqual(sortedRides.count, 4)
        
        for (i, ride) in sortedRides.enumerated() {
            guard i != 0 else { continue }
            
            XCTAssertTrue(sortedRides[i - 1].clothNumber < ride.clothNumber)
        }
    }
    
    func testCanSortByOdds() {
        let rides = rides
        
        XCTAssertEqual(rides.count, 4)
        
        let sortManager = SortManager()
        
        let sortedRides = sortManager.sort(rides, using: OddsSorter())
        
        XCTAssertEqual(sortedRides.count, 4)
        
        for (i, ride) in sortedRides.enumerated() {
            guard i != 0 else { continue }
            
            let oddsComparer = OddsComparer()
            let oddsParserHelper = OddsParserHelper() // Tests helper object
            let odds1 = oddsParserHelper.parseOddsFromString(odds: sortedRides[i - 1].currentOdds)
            let odds2 = oddsParserHelper.parseOddsFromString(odds: ride.currentOdds)
            
            let comparisonResult = oddsComparer.compare(odds1, odds2)
            
            XCTAssertTrue(comparisonResult == .odds1Better || comparisonResult == .equal)
        }
    }

}
