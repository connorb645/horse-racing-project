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
            Color.pink
        }
        .edgesIgnoringSafeArea(.all)
    }
}
//
//struct RaceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RaceDetailView(viewModel: RaceDetailViewModel(race: <#T##Race#>))
//    }
//}
