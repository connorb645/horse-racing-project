//
//  RaceDetailViewModel.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import SwiftUI

class RaceDetailViewModel: ObservableObject {
    var race: Race
    
    init(race: Race) {
        self.race = race
    }
}
