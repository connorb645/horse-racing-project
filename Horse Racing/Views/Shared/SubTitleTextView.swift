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
    let alignment: Alignment
    
    init(text: String, textColor: Color = .black, alignment: Alignment = .leading) {
        self.text = text
        self.textColor = textColor
        self.alignment = alignment
    }
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: alignment)
            .font(.subheadline.bold())
            .foregroundColor(textColor)
    }
}

struct SubTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        SubTitleTextView(text: "Sub Title Text")
    }
}
