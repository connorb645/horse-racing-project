//
//  DataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

/// API blueprint for a data fetcher
protocol DataFetcher {
    func fetchData<T: Decodable>() -> Result<T, DataFetcherError>
}
