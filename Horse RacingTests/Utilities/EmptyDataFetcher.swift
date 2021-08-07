//
//  EmptyDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation
@testable import Horse_Racing

/// A subclass of the BaseDataFetcher which provides a default filename and filetype.
/// This class is designed to result in a successful but empty data fetch.
class EmptyDataFetcher: BaseDataFetcher {
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "EmptyData",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
}
