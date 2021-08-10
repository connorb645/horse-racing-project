//
//  RacesDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

/// A subclass of the BaseDataFetcher which provides a default filename and filetype for the races data within the main bundle.
class RacesDataFetcher: BaseDataFetcher {
    init(fileReader: FileReader = FileReader(), jsonFileDecoder: JsonFileDecoder = JsonFileDecoder()) {
        super.init(fileName: "RacesData",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
    
    
    /// Method to fetch a random race, or nil if an error was hit
    /// - Returns: Random race
    func fetchRandomRace() -> Race? {
        let result: Result<[Race], DataFetcherError> = self.fetchData()
        
        switch result {
        case .success(let races):
            return races.randomElement()
        default:
            return nil
        }
    }
}
