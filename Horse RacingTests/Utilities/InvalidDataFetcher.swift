//
//  InvalidDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

@testable import Horse_Racing

/// A subclass of the BaseDataFetcher which provides a default filename and filetype.
/// This class is designed to result in a failed data fetch
class InvalidDataFetcher: BaseDataFetcher {
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "InvalidFilename",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
}
