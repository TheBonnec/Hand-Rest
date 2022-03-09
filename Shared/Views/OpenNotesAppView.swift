//
//  OpenNotesAppView.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 03/03/2022.
//

import SwiftUI

struct OpenNotesAppView: View {
    
    var side: Side
    var sideText: String
    var selectedColor: HRColor
    
    init(side: Side, selectedColor: HRColor) {
        self.side = side
        self.sideText = side == .left ? String(localized: "Left") : String(localized: "Right")
        self.selectedColor = selectedColor
    }
    
    var body: some View {
        ZStack() {
            selectedColor.accentColor
                .cornerRadius(15, corners: side == .left ? .topRight : .topLeft)
                .cornerRadius(15, corners: side == .left ? .bottomRight : .bottomLeft)
            
            Text("Open-Notes-App-Text \(sideText)")
                .multilineTextAlignment(.center)
        }
        .ignoresSafeArea()
        .hCenter()
        .vCenter()
        .frame(maxWidth: 250)
    }
}






struct OpenNotesAppView_Previews: PreviewProvider {
    static var previews: some View {
        OpenNotesAppView(side: .left, selectedColor: .hrDynamic)
    }
}




enum Side {
    case left, right
}
