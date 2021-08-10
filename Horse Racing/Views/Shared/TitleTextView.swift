//
//  TitleTextView.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct TitleTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title.bold())
    }
}

struct TitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextView(text: "Test Title")
    }
}
