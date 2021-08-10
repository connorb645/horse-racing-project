//
//  FormParser.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import Foundation

struct FormParser {
    func parse(_ formString: String) -> Form {
        let raceResults = formString.map { raceFormString in
            Int("\(raceFormString)") ?? 0
        }
        
        return Form(raceResults: raceResults)
    }
}
