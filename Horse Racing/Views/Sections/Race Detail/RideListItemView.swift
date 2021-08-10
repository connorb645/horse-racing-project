//
//  RideListItemView.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct RideListItemView: View {
    
    let ride: Ride
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            HStack {
                
                // MARK: - Ride Details
                VStack(spacing: 6) {
                    GroupedTitleTextView(titleText: "Horse Name", bodyText: "\(ride.horse.name)", spacing: 4)
                    GroupedTitleTextView(titleText: "Horse Age", bodyText: "\(ride.horse.age)", spacing: 4)
                    GroupedTitleTextView(titleText: "Days Since Last Run", bodyText: "\(ride.horse.daysSinceLastRun)", spacing: 4)
                    GroupedTitleTextView(titleText: "Form", bodyText: "\(ride.formsummary)", spacing: 4)
                    GroupedTitleTextView(titleText: "Cloth Number", bodyText: "\(ride.clothNumber)", spacing: 4)
                }
                
                Spacer()
                
                // MARK: - Odds Column
                VStack {
                    Spacer()
                    
                    TitlePillButton(title: ride.currentOdds, width: 100) {
                        guard let url = Bundle.main.object(forInfoDictionaryKey: "SkyBetUrl") as? String else { return }

                        guard let url = URL(string: url) else { return }
                        
                        openURL(url)
                    }
            
                }
            }
            .padding()
                        
            Rectangle()
                .foregroundColor(.gray.opacity(0.15))
                .frame(height: 5)
                .cornerRadius(2.5)
        }
    }
}

struct RideListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RideListItemView(ride: MockGenerator().getMockRide(horseName: "Random Horse", clothNumber: 1, odds: "2/1"))
    }
}
