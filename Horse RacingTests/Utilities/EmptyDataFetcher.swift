//
//  EmptyDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation
@testable import Horse_Racing

class EmptyDataFetcher: BaseDataFetcher {
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "EmptyData",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
}
