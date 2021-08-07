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
    
    public var state: RacesViewModelState = .empty {
        didSet {
            print("reconfigure the screen")
        }
    }
    
    init(dataFetcher: DataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    /// Fetches the races using the supplied data fetcher and then sets the view model state accordingly.
    func fetchRaces() {
        let result: Result<[Race], DataFetcherError> = dataFetcher.fetchData()
        
        switch result {
        case .success(let races):
            self.races = races
            if races.isEmpty {
                state = .empty
            } else {
                state = .successful(races: races)
            }
        case .failure(let error):
            switch error {
            case .failedWithMessage(let message):
                state = .failed(message: message)
                return
            }
        }
    }
}
