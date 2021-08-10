//
//  SegmentedControl.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import SwiftUI

struct SegmentedControl: View {
    
    @State var selectedIndex: Int = 0
    
    let selections: [String]
    let action: (Int) -> Void
    
    var body: some View {
        HStack {
            ForEach(selections, id: \.self) { selection in
                let index = selections.firstIndex(of: selection)
                
                let isSelected = selectedIndex == index
                
                Button(selection) {
                    withAnimation {
                        selectedIndex = index ?? 0
                        /// Including the action in the animation will give us the animated list refresh which is nice
                        action(selectedIndex)
                    }
                }
                .foregroundColor(isSelected ? .white : .gray)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(isSelected ? .pink : .clear))
            }
        }
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(selections: ["Odds", "Cloth Number"]) { index in
            print("Selected index: \(index)")
        }
    }
}
