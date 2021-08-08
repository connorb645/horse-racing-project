//
//  Race.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

struct Race: Decodable, Equatable, Hashable {
    let raceSummary: RaceSummary
    let rides: [Ride]
}

extension Race {
    var overview: String {
        return "\(raceSummary.time) - \(raceSummary.name)"
    }
}
