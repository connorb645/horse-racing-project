//
//  FormSorter.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import Foundation

struct FormSorter: Sorter {
    
    let formParser: FormParser
    let formScoreCalculator: FormScoreCalculator
    
    init(formParser: FormParser = FormParser(), formScoreCalculator: FormScoreCalculator = FormScoreCalculator()) {
        self.formParser = formParser
        self.formScoreCalculator = formScoreCalculator
    }
    
    func shouldFormerPreceed(ride1: Ride, ride2: Ride) -> Bool {
        let form1 = formParser.parse(ride1.formsummary)
        let form2 = formParser.parse(ride2.formsummary)
        
        let formScore1 = formScoreCalculator.calculateScore(fromForm: form1)
        let formScore2 = formScoreCalculator.calculateScore(fromForm: form2)
        
        return formScore1 <= formScore2
    }
}
