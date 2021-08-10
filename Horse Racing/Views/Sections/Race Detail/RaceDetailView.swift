//
//  RaceDetailView.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import SwiftUI

struct RaceDetailView: View {
    
    @ObservedObject var viewModel: RaceDetailViewModel
    
    init(viewModel: RaceDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        /// ScrollView -> LazyVStack is a workaround to get a list without seperators, while maintaining performance.
        ScrollView {
            LazyVStack {
                
                // MARK: - Summary Section
                VStack {
                    RaceSummaryView(race: viewModel.race)
                }
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                // MARK: - Segmented Filter Control
                SegmentedControl(selections: ["Odds", "Cloth Number", "Form"]) { selectedIndex in
                    viewModel.sortRides(as: RideSort(rawValue: selectedIndex) ?? .odds)
                }
                
                // MARK: - List of rides in race
                ForEach(viewModel.rides) { ride in
                    RideListItemView(ride: ride)
                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailView(viewModel: RaceDetailViewModel(race: MockGenerator().getMockRace()))
    }
}
