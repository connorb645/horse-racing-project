//
//  SubTitleTextView.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct SubTitleTextView: View {
    
    let text: String
    let textColor: Color
    
    init(text: String, textColor: Color = .black) {
        self.text = text
        self.textColor = textColor
    }
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline.bold())
            .foregroundColor(textColor)
    }
}

struct SubTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        SubTitleTextView(text: "Sub Title Text")
    }
}
