//
//  Horse.swift
//  Horse Racing
//
//  Created on 06/08/2021.
//

import Foundation

struct Horse: Decodable, Equatable, Hashable {
    let name: String
    let daysSinceLastRun: Int
    let age: Int
}
