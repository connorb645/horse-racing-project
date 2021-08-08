//
//  RacesViewModel.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

protocol RacesViewModelAbstraction: AnyObject {
    func setStateChangeDelegate(to sender: StateChangeDelegate)
    func fetchRaces()
}

class RacesViewModel : RacesViewModelAbstraction {
    var races: [Race] = []
    
    weak var stateChangeDelegate: StateChangeDelegate?
    
    private let dataFetcher: DataFetcher
    
    public var state: ViewState<Race> = .empty {
        didSet {
            stateChangeDelegate?.stateChanged(to: state)
        }
    }
    
    init(dataFetcher: DataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    // MARK: - RacesViewModelAbstraction Conformance
    
    /// Fetches the races using the supplied data fetcher and then sets the view model state accordingly.
    func fetchRaces() {
        let result: Result<[Race], DataFetcherError> = dataFetcher.fetchData()
        
        switch result {
        case .success(let races):
            self.races = races
            if races.isEmpty {
                state = .empty
            } else {
                state = .successful(items: races)
            }
        case .failure(let error):
            switch error {
            case .failedWithMessage(let message):
                state = .failed(message: message)
                return
            }
        }
    }
    
    func setStateChangeDelegate(to sender: StateChangeDelegate) {
        self.stateChangeDelegate = sender
    }
}
