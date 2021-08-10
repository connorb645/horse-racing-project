//
//  FormScoreCalculator.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import Foundation

struct FormScoreCalculator {
    
    let decimalPlacesService: DecimalPlacesService
    
    init(decimalPlacesService: DecimalPlacesService = DecimalPlacesService()) {
        self.decimalPlacesService = decimalPlacesService
    }
    
    /// In my made up score calculation I'm assigning a place of 10 to any race result which was 0 or a dash
    /// (The dash is replaced with a zero by this point whence why i don't check)
    /// I then simply calculate the mean average and the lower the result the better.
    /// At the end I round to 2 decimal places.
    func calculateScore(fromForm form: Form) -> Double {
        var score: Double = 0
        
        form.raceResults.forEach { raceResult in
            if raceResult == 0 {
                score += 10.0
            } else {
                score += Double(raceResult)
            }
        }
        
        score = score / Double(form.raceResults.count)
        
        return decimalPlacesService.roundTo2DecimalPlaces(score)
    }
}
