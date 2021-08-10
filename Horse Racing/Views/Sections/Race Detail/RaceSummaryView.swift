//
//  RaceSummaryView.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct RaceSummaryView: View {
    
    let race: Race
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
            
            VStack(spacing: 16) {
                TitleTextView(text: race.overview)
                GroupedTitleTextView(titleText: "Going", bodyText: race.raceSummary.going, spacing: 8)
                GroupedTitleTextView(titleText: "Distance", bodyText: race.raceSummary.distance, spacing: 8)
                GroupedTitleTextView(titleText: "Race Stage", bodyText: race.raceSummary.raceStage, spacing: 8)
                GroupedTitleTextView(titleText: "Ride Count", bodyText: "\(race.raceSummary.rideCount)", spacing: 8)
            }
            .padding()
        }
    }
}

struct RaceSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        RaceSummaryView(race: MockGenerator().getMockRace())
    }
}
