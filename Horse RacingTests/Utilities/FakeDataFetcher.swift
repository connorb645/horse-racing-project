//
//  FakeDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation
@testable import Horse_Racing

/// A subclass of the BaseDataFetcher which provides a default filename and filetype.
/// This class also overrides the fetchData method so we can keep track of the fakeTriggerCount and ensure the fetchData method is being called.
class FakeDataFetcher: BaseDataFetcher {

    var fakeTriggerCount = 0 // For testing purposes -- unique to FakeDataFetcher
    
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "FakeRacesData",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
    
    override func fetchData<T: Decodable>() -> Result<T, DataFetcherError> {
        fakeTriggerCount = fakeTriggerCount + 1
        return super.fetchData()
    }
}
