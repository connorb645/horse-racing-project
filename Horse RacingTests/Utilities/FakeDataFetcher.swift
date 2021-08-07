//
//  FakeDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation
@testable import Horse_Racing

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
