//
//  ContentView.swift
//  Shared
//
//  Created by Thomas Le Bonnec on 16/02/2022.
//

import SwiftUI


struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var selectedColor = SelectedColorViewModel()
    @EnvironmentObject var lockMode: LockModeViewModel
    @State var orientation: Orientation = .horizontal
    
    
    var body: some View {
        ZStack {
            // Background
            selectedColor.selectedColor.color
                .ignoresSafeArea()

            HStack(spacing: 0) {
                // Open Note app indication (left)
                if horizontalSizeClass == .regular {
                    OpenNotesAppView(side: .left, selectedColor: selectedColor.selectedColor)
                }
                
                // Color Picker Menu and Unlock Slide
                HStack {
                    ColorMenu(selectedColor: selectedColor, orientation: orientation)
                    VStack {
                        LockModeSliderView(selectedColor: selectedColor.selectedColor)
                    }
                    .opacity(horizontalSizeClass == .compact ? 1 : 0)
                    .vBottom()
                }
                .hCenter()
                .padding(16)
                
                // Open Note app indication (right)
                if horizontalSizeClass == .regular {
                    OpenNotesAppView(side: .right, selectedColor: selectedColor.selectedColor)
                }
            }
        }
        // Unlock the view if it becomes regular
        .onChange(of: horizontalSizeClass) { newValue in
            if newValue == .regular {
                self.lockMode.unlock()
                self.orientation = .horizontal
            } else {
                self.orientation = .vertical
            }
        }
    }
}



enum Orientation {
    case vertical, horizontal
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
