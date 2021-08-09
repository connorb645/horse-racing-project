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
        ZStack {
            VStack {
                /// ScrollView -> LazyVStack is a workaround to get a list without seperators.
                ScrollView {
                    LazyVStack {
                        VStack {
                            raceSummaryContainer
                        }
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        
                        ForEach(viewModel.rides) { ride in
                            listCell(ride)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    var raceSummaryContainer: some View {
        ZStack {
            Color.gray.opacity(0.1)
            
            VStack(spacing: 16) {
                titleText(viewModel.race.overview)
                groupedTitleText("Going", body: viewModel.race.raceSummary.going)
                groupedTitleText("Distance", body: viewModel.race.raceSummary.distance)
                groupedTitleText("Race Stage", body: viewModel.race.raceSummary.raceStage)
                groupedTitleText("Ride Count", body: "\(viewModel.race.raceSummary.rideCount)")
            }
            .padding()
        }
    }
    
    func groupedTitleText(_ title: String, body: String, spacing: CGFloat = 8) -> some View {
        VStack(spacing: spacing) {
            subTitleText(title)
            bodyText(body)
        }
    }
    
    func titleText(_ text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title.bold())
    }
    
    func subTitleText(_ text: String, textColor: Color = .gray) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline.bold())
            .foregroundColor(textColor)
    }
    
    func bodyText(_ text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.body)
    }
    
    func capsuleText(_ text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.body.bold())
    }
    
    func listCell(_ ride: Ride) -> some View {
        VStack {
            HStack {
                
                VStack(spacing: 6) {
                    groupedTitleText("Horse Name", body: "\(ride.horse.name)", spacing: 4)
                    groupedTitleText("Horse Age", body: "\(ride.horse.age)", spacing: 4)
                    groupedTitleText("Days Since Last Run", body: "\(ride.horse.daysSinceLastRun)", spacing: 4)
                    groupedTitleText("Form", body: "\(ride.formsummary)", spacing: 4)
                    groupedTitleText("Cloth Number", body: "\(ride.clothNumber)", spacing: 4)
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    capsuleText(ride.currentOdds)
                        .frame(width: 80)
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().foregroundColor(.pink))
                    
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


struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailView(viewModel: RaceDetailViewModel(race: MockGenerator().getMockRace()))
    }
}
