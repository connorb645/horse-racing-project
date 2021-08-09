//
//  RaceDetasilViewModelTests.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import XCTest
@testable import Horse_Racing

class RaceDetailViewModelTests: XCTestCase {
    
    var fakeRace: Race {
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: JsonFileDecoder())
        let result: Result<[Race], DataFetcherError> = dataFetcher.fetchData()
        switch result {
        case .success(let races):
            return races.first!
        default:
            fatalError("Failed to read data using FakeDataFetcher")
        }
    }

    var SUT: RaceDetailViewModel {
        return RaceDetailViewModel(race: fakeRace)
    }
    
    func testRidesInitiallySortedByOdds() {
        
        let sut = SUT
        
        let rides = sut.rides
        
        for (i, ride) in rides.enumerated() {
            guard i != 0 else { continue }
            
            let oddsComparer = OddsComparer()
            let oddsParserHelper = OddsParserHelper() // Tests helper object
            let odds1 = oddsParserHelper.parseOddsFromString(odds: rides[i - 1].currentOdds)
            let odds2 = oddsParserHelper.parseOddsFromString(odds: ride.currentOdds)
            
            let comparisonResult = oddsComparer.compare(odds1, odds2)
            
            XCTAssertTrue(comparisonResult == .odds1Better || comparisonResult == .equal)
        }
        
    }

}
