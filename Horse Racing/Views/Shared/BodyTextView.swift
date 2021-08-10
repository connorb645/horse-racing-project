//
//  BodyTextView.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct BodyTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.body)
    }
}

struct BodyTextView_Previews: PreviewProvider {
    static var previews: some View {
        BodyTextView(text: "Body Text")
    }
}
