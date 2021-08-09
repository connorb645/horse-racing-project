//
//  MockRaceGenerator.swift
//  Horse Racing
//
//  Created on 09/08/2021.
//

import Foundation

struct MockGenerator {
    func getMockRace() -> Race {
        return Race(raceSummary: getMockRaceSummary(),
                    rides: [
                        getMockRide(horseName: "Parmigiano", clothNumber: 1, odds: "1/4"),
                        getMockRide(horseName: "Vivacious Vivian", clothNumber: 5, odds: "2/16"),
                        getMockRide(horseName: "Brighton Belle", clothNumber: 2, odds: "3/4"),
                        getMockRide(horseName: "Twinkle Town", clothNumber: 3, odds: "1/6"),
                        getMockRide(horseName: "Music Maker", clothNumber: 14, odds: "10/4"),
                        getMockRide(horseName: "Madam Secretary", clothNumber: 10, odds: "9/3"),
                        getMockRide(horseName: "Casa De Var", clothNumber: 9, odds: "2/4")
                    ])
    }
    
    func getMockRaceSummary() -> RaceSummary {
        RaceSummary(name: "Woodbine", courseName: "Woodbine", distance: "6f 110y", date: "2017-12-15", time: "18:10", rideCount: 8, raceStage: "WEIGHEDIN", going: "Good to Soft", hasHandicap: false, hidden: false)
    }
    
    func getMockRide(horseName: String, clothNumber: Int, odds: String) -> Ride {
        return Ride(clothNumber: clothNumber, horse: getMockHorse(name: horseName), formsummary: "1234-567", withdrawn: false, handicap: "9-6", currentOdds: odds)
    }
    
    func getMockHorse(name: String) -> Horse {
        return Horse(name: name, daysSinceLastRun: 21, age: 4)
    }
}
