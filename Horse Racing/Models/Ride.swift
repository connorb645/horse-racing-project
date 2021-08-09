//
//  Rider.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

struct Ride: Decodable, Equatable, Hashable, Identifiable {
    var id: UUID = UUID()
    let clothNumber: Int
    let horse: Horse
    let formsummary: String
    let withdrawn: Bool?
    let handicap: String
    let currentOdds: String
    
    init(clothNumber: Int, horse: Horse, formsummary: String, withdrawn: Bool?, handicap: String, currentOdds: String) {
        self.clothNumber = clothNumber
        self.horse = horse
        self.formsummary = formsummary
        self.withdrawn = withdrawn
        self.handicap = handicap
        self.currentOdds = currentOdds
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        clothNumber = try values.decode(Int.self, forKey: .clothNumber)
        horse = try values.decode(Horse.self, forKey: .horse)
        formsummary = try values.decode(String.self, forKey: .formsummary)
        withdrawn = try values.decodeIfPresent(Bool.self, forKey: .withdrawn)
        handicap = try values.decode(String.self, forKey: .handicap)
        currentOdds = try values.decode(String.self, forKey: .currentOdds)
    }
    
    enum CodingKeys: String, CodingKey {
        case clothNumber
        case horse
        case formsummary
        case withdrawn
        case handicap
        case currentOdds
    }
}
