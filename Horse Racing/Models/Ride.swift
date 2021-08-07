//
//  Rider.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

struct Ride: Decodable, Equatable, Hashable {
    let clothNumber: Int
    let horse: Horse
    let formsummary: String
    let withdrawn: Bool?
    let handicap: String
    let currentOdds: String
}
