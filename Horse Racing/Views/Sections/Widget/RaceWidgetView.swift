//
//  RaceWidgetView.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct RaceWidgetView: View {
    let race: Race?
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            VStack(alignment: .center, spacing: 16) {
                SubTitleTextView(text: race?.overview ?? "No Race Found", alignment: .center)
                
                VStack(alignment: .center, spacing: 4) {
                    SubTitleTextView(text: race?.rides.first?.horse.name ?? "No favourite", textColor: .gray, alignment: .center)
                    
                    TitlePillButton(title: race?.rides.first?.currentOdds ?? "No Odds", width: 80) {}
                }
            }
            
        }
    }
}

struct RaceWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        RaceWidgetView(race: MockGenerator().getMockRace())
    }
}
