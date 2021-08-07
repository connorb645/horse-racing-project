//
//  BaseDataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

class BaseDataFetcher: DataFetcher {
        
    private let fileName: String
    private let fileType: FileType
    private let fileReader: FileReader
    private let jsonFileDecoder: JsonFileDecoder
    
    /// Initializer for BaseDataFetcher
    /// - Parameters:
    ///   - fileName: The file name we should try to extract using FileReader
    ///   - fileType: The file type we should try to extract using FileReader
    ///   - fileReader: The file reader we should use to extract data with
    ///   - jsonFileDecoder: The json decoder we should use to convert data into a specified model with
    init(fileName: String, fileType: FileType, fileReader: FileReader, jsonFileDecoder: JsonFileDecoder) {
        self.fileName = fileName
        self.fileType = fileType
        self.fileReader = fileReader
        self.jsonFileDecoder = jsonFileDecoder
    }
    
    /// A method that extracts data using class scoped parameters
    /// - Returns: A Result type of either T: Decodable or a DataFetcherError
    func fetchData<T: Decodable>() -> Result<T, DataFetcherError> {
        do {
            let data = try fileReader.readData(fromFile: fileName, ofType: fileType)
            let parsedData: T = try jsonFileDecoder.decode(data: data)
            return .success(parsedData)
        } catch FileError.dataExtractionError {
            return .failure(.failedWithMessage("Error extracting data from file."))
        } catch FileError.noFileFoundWithName(let name) {
            return .failure(.failedWithMessage("File not found with name: \(name)"))
        } catch JsonDecodingError.decodingFailedWithMessage(let message) {
            return .failure(.failedWithMessage("Decoding failed with message: \(message)"))
        } catch {
            return .failure(.failedWithMessage("An unknown error"))
        }
    }
}
