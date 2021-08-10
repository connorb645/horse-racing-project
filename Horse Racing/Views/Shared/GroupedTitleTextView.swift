//
//  GroupedTitleText.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct GroupedTitleTextView: View {
    let titleText: String
    let bodyText: String
    let spacing: CGFloat
    
    var body: some View {
        VStack(spacing: spacing) {
            SubTitleTextView(text: titleText, textColor: .gray)
            BodyTextView(text: bodyText)
        }
    }
}

struct GroupedTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedTitleTextView(titleText: "Title", bodyText: "This is the body", spacing: 8)
    }
}
