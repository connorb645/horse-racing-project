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
            VStack {
                Text(race?.overview ?? "No Race Found")
                    .foregroundColor(.white)
                
                Text(race?.rides.first?.currentOdds ?? "No favourite")
            }
            
        }
    }
}

struct RaceWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        RaceWidgetView(race: MockGenerator().getMockRace())
    }
}
