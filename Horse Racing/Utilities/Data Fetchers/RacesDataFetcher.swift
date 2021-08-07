//
//  RacesDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

/// A subclass of the BaseDataFetcher which provides a default filename and filetype for the races data within the main bundle.
class RacesDataFetcher: BaseDataFetcher {
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "RacesData",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
}
