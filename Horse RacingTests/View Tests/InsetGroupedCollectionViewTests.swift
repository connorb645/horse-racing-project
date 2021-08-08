//
//  InsetGroupedCollectionViewTests.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import XCTest
@testable import Horse_Racing

class InsetGroupedCollectionViewTests: XCTestCase {

    /// Getter for the system under test
    var SUT: InsetGroupedCollectionView {
        return InsetGroupedCollectionView()
    }
    
    /// Test to ensure the UI elements are configured correctly when setting the state to successful
    func testIsSuccessfulStateCorrect() {
        let sut = SUT
        
        let successfulState = ViewState<String>.successful(items: ["TestItemOne", "TestItemTwo"])
        
        sut.setState(successfulState)
        
        XCTAssertTrue(sut.stackContainerView.isHidden)
        XCTAssertFalse(sut.collectionView.isHidden)
    }
    
    /// Test to ensure the UI elements are configured correctly when setting the state to failed
    func testIsFailedStateCorrect() {
        let sut = SUT
        
        let failedState = ViewState<String>.failed(message: "Test failed state")
        
        sut.setState(failedState)
        
        XCTAssertTrue(sut.collectionView.isHidden)
        XCTAssertFalse(sut.stackContainerView.isHidden)
        XCTAssertEqual(sut.textView.text, "Test failed state")
    }
    
    /// Test to ensure the UI elements are configured correctly when setting the state to empty
    func testIsEmptyStateCorrect() {
        let sut = SUT
        
        let failedState = ViewState<String>.empty
        
        sut.setState(failedState)
        
        XCTAssertTrue(sut.collectionView.isHidden)
        XCTAssertFalse(sut.stackContainerView.isHidden)
        XCTAssertEqual(sut.textView.text, "Hmm, it looks like you're missing some data")
    }

}
