//
//  RacesViewModelTests.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import XCTest
@testable import Horse_Racing

class RacesViewModelTests: XCTestCase {
    
    /// A test to check that we are able to successfully retrieve, parse and store races.
    func testCanLoadRaces() {
        
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let jsonFileDecoder = JsonFileDecoder()
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
        
        let racesViewModel = RacesViewModel(dataFetcher: dataFetcher)
        
        XCTAssertTrue(racesViewModel.races.isEmpty)
        
        racesViewModel.fetchRaces()
        
        XCTAssertFalse(racesViewModel.races.isEmpty)
    }

    /// A test to check that we are actually calling the data fetcher to retrieve the data, and not embedding the logic in the view model.
    func testIsLoadingRacesFromDataFetcher() {
        
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let jsonFileDecoder = JsonFileDecoder()
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
        
        let racesViewModel = RacesViewModel(dataFetcher: dataFetcher)
        
        XCTAssertTrue(racesViewModel.races.isEmpty)
        
        XCTAssertEqual(dataFetcher.fakeTriggerCount, 0)
        
        racesViewModel.fetchRaces()
        
        XCTAssertEqual(dataFetcher.fakeTriggerCount, 1)
    }
    
    
    /// A test to check that we are retrieving the correct number of races from the test data file provided in the FakeDataFetcher
    func testIsRetrievingCorrectNumbrOfRaces() {
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let jsonFileDecoder = JsonFileDecoder()
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
        
        let racesViewModel = RacesViewModel(dataFetcher: dataFetcher)
        
        XCTAssertTrue(racesViewModel.races.isEmpty)
                
        racesViewModel.fetchRaces()
        
        XCTAssertEqual(racesViewModel.races.count, 3)
    }
    
    
    /// A test to check that before fetching the data we have an empty state, and after a successful fetch, we have a successful state with the correct races.
    func testStateIsEmptyBeforeAndSuccessfulAfterSuccessfulDataRead() {
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let jsonFileDecoder = JsonFileDecoder()
        let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
        
        let racesViewModel = RacesViewModel(dataFetcher: dataFetcher)
        
        XCTAssertEqual(racesViewModel.state, .empty)
                
        racesViewModel.fetchRaces()
        
        XCTAssertEqual(racesViewModel.state, .successful(races: racesViewModel.races))
    }
    
    func testStateIdEmptyBeforeAndFailedAfterUnsuccessfulDataRead() {
        let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
        let jsonFileDecoder = JsonFileDecoder()
        let dataFetcher = InvalidDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
        
        let racesViewModel = RacesViewModel(dataFetcher: dataFetcher)
        
        XCTAssertEqual(racesViewModel.state, .empty)
                
        racesViewModel.fetchRaces()
        
        XCTAssertEqual(racesViewModel.state, .failed(message: "File not found with name: InvalidFilename"))
    }
}
