//
//  DataFetcherError.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

/// Errors to throw when DataFetcher fails
enum DataFetcherError: Error {
    case failedWithMessage(_ message: String)
}
