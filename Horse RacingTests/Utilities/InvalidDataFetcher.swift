//
//  InvalidDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

@testable import Horse_Racing

class InvalidDataFetcher: BaseDataFetcher {
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "InvalidFilename",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
}
