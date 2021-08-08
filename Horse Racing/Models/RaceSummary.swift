//
//  RaceSummary.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

struct RaceSummary: Decodable, Equatable, Hashable {
    let name: String
    let courseName: String
    let distance: String
    let date: String
    let time: String
    let rideCount: Int
    let raceStage: String
    let going: String
    let hasHandicap: Bool
    let hidden: Bool
}
