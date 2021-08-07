//
//  DataFetcher.swift
//  Horse Racing
//
//  Created on 07/08/2021.
//

import Foundation

protocol DataFetcher {
    func fetchData<T: Decodable>() -> Result<T, DataFetcherError>
}
