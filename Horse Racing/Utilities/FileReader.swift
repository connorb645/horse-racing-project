//
//  FileReader.swift
//  Horse Racing
//
//  Created on 30/07/2021.
//

import Foundation

/// Used to read and return data from a file.
struct FileReader {
    
    private let bundle: Bundle
    
    /// FileReader initializer
    /// - Parameter bundle: The bundle which the file will reside.
    init(inBundle bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }
    
    /// Reads data from a specified file, with a specified file type.
    /// - Parameters:
    ///   - file: The name of the file to be read from.
    ///   - type: The type of file which will be read.
    /// - Throws: A FileError if the file can't be found in the bundle, or if an Error occurred when creating a Data object with the contents of the path URL.
    /// - Returns: The Data object extraced from the file
    func readData(fromFile file: String = "RacesData", ofType type: FileType = .json) throws -> Data {
        guard let path = bundle.path(forResource: file, ofType: type.rawValue) else {
            throw FileError.noFileFoundWithName(file)
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            throw FileError.dataExtractionError
        }
    }
    
}
