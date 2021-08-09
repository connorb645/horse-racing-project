//
//  RaceDetasilViewModelTests.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import XCTest
@testable import Horse_Racing

class RaceDetailViewModelTests: XCTestCase {

    var SUT: RaceDetailViewModel {
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: JsonFileDecoder())
        let result: Result<[Race], DataFetcherError> = dataFetcher.fetchData()
        switch result {
        case .success(let races):
            return RaceDetailViewModel(race: races.first!)
        default:
            fatalError("Failed to read data using FakeDataFetcher")
        }
    }
    
    func testSomething() {
        
        let sut = SUT
        
        
        
    }

}
