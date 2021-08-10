//
//  OddsPill.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct TitlePillButton: View {
    
    let title: String
    let width: CGFloat?
    let action: () -> ()
    
    var body: some View {
        
        /// In iOS 15 I believe we will be getting conditional modifiers to make the following cleaner.
        if let width = width {
            Button(title) {
                action()
            }
            .foregroundColor(.white)
            .frame(width: width, height: 50)
            .background(Capsule().foregroundColor(.pink))
        } else {
            Button(title) {
                action()
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Capsule().foregroundColor(.pink))
        }
    }
}

struct TitlePillButton_Previews: PreviewProvider {
    static var previews: some View {
        TitlePillButton(title: "2/3", width: 100) {
            print("Pill button tapped")
        }
    }
}
