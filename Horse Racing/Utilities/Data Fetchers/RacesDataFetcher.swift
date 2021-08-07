//
//  RacesDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

class RacesDataFetcher: BaseDataFetcher {
    
    init(fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        super.init(fileName: "RacesData",
                   fileType: .json,
                   fileReader: fileReader,
                   jsonFileDecoder: jsonFileDecoder)
    }
    
}
