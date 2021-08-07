//
//  Race.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

struct Race: Decodable, Equatable {
    let raceSummary: RaceSummary
    let rides: [Ride]
}