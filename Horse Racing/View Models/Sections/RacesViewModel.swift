//
//  RacesViewModel.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

class RacesViewModel {
    
    var races: [Race] = []
    
    private let dataFetcher: DataFetcher
    
    public var state: RacesViewModelState = .empty
    
    init(dataFetcher: DataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    /// Fetches races and stores them in the races array, ready to populate the collection view
    func fetchRaces() {
        let result: Result<[Race], DataFetcherError> = dataFetcher.fetchData()
        
        switch result {
        case .success(let races):
            self.races = races
            state = .successful(races: races)
        case .failure(let error):
            switch error {
            case .failedWithMessage(let message):
                state = .failed(message: message)
                return
            }
        }
    }
}
