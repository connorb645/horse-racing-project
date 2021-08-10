//
//  RaceDetailViewModel.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import SwiftUI

enum RideSort: Int {
    case odds, clothNumber
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
    
    func sortRides(as sort: RideSort) {
        let sorter: Sorter = sort == .clothNumber ? ClothNumberSorter() : OddsSorter()
        rides = sortManager.sort(rides, using: sorter)
    }

}
