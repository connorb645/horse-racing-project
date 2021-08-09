//
//  RacesViewControllerTests.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import XCTest
@testable import Horse_Racing

class RacesViewControllerTests: XCTestCase {
    
    // MARK: - Creating the RacesViewControllerMock and scoping it locally, as it is specific to these tests.
    
    class InsetGroupedCollectionViewPartialMock: InsetGroupedCollectionView {
        var didStateChangeFunctionGetTriggered = false
        
        override func setState<T>(_ state: ViewState<T>) where T : Hashable {
            didStateChangeFunctionGetTriggered = true
        }
    }

    class RacesViewControllerPartialMock: RacesViewController {
        
        var didStateChangeFunctionGetTriggered = false
        
        override func stateChanged<T: Hashable>(to state: ViewState<T>) {
            didStateChangeFunctionGetTriggered = true
            super.stateChanged(to: state)
        }
    }
    
    // MARK: - Initialise the System Under Test and all of its dependencies
    
    private var SUT: (RacesViewControllerPartialMock, InsetGroupedCollectionViewPartialMock) {
        get {
            let racesView = InsetGroupedCollectionViewPartialMock()
            let fileReader = FileReader(inBundle: Bundle.init(for: type(of: self)))
            let jsonFileDecoder = JsonFileDecoder()
            let dataFetcher = FakeDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
            let viewModel = RacesViewModel(dataFetcher: dataFetcher)
            return (RacesViewControllerPartialMock(viewModel: viewModel, view: racesView),
                    racesView)
        }
    }
    
    /// Test to confirm the view model delegate is correctly configured and implemented on the view controller
    /// Specifically, we know the view controller is notified when the view model triggers the state change delegate.
    func testStateChangeFunctionWasTriggered() {
        let sut = SUT
        
        sut.0.loadViewIfNeeded()
        
        XCTAssertTrue(sut.0.didStateChangeFunctionGetTriggered)
    }
    
    /// Test to confirm the view recieves the state change notification from the view model
    func testStateChangeFunctionWasTriggedInTheView() {
        let sut = SUT
        
        sut.0.loadViewIfNeeded()
        
        XCTAssertTrue(sut.1.didStateChangeFunctionGetTriggered)
    }
    
    /// Test to confim that the cells views will show what we ask it to.
    func testCellConfiguration() {
        let sut = SUT
        
        let viewController = sut.0
        let view = sut.1
        
        viewController.loadViewIfNeeded()
        
        guard let cell = view.collectionView.dequeueReusableCell(withReuseIdentifier: OverviewCollectionViewCell.reuseIdentifier, for: IndexPath(row: 0, section: 0)) as? OverviewCollectionViewCell else {
            XCTFail("Failed to deque OverviewCollectionViewCell")
            return
        }
        
        cell.configureWith(title: "This is a test")
        
        XCTAssertEqual(cell.titleLabel.text, "This is a test")
    }
}
