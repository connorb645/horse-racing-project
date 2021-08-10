//
//  RaceDetailViewModel.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import SwiftUI

enum RideSort: Int {
    case odds, clothNumber, form
}

class RaceDetailViewModel: ObservableObject {
    
    @Published var race: Race
    @Published var rides: [Ride]
    
    let sortManager: SortManager
    
    init(race: Race, sortManager: SortManager = SortManager()) {
        self.race = race
        self.sortManager = sortManager
        
        self.rides = sortManager.sort(race.rides, using: OddsSorter())
    }
    
    /// Sorts the rides in the list displayed on the UI since rides is a published property
    /// - Parameter sort: Defines the method of sorting.
    func sortRides(as sort: RideSort) {
        var sorter: Sorter!
        
        switch sort {
        case .odds:
            sorter = OddsSorter()
        case .clothNumber:
            sorter = ClothNumberSorter()
        case .form:
            sorter = FormSorter()
        }
        
        rides = sortManager.sort(rides, using: sorter)
    }

}
