//
//  ColorMenu.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 17/02/2022.
//

import SwiftUI


// MARK: The view of all the possible background colors + the selected color
struct ColorMenu: View {
    
    @ObservedObject var selectedColor: SelectedColorViewModel
    @EnvironmentObject var lockMode: LockModeViewModel
    var orientation: Orientation
    
    
    var body: some View {
        VStack(spacing: 16) {
            vertivalContent
        }
        .frame(width: 56, height: lockMode.lockMode ? 40 : nil)
        .padding(.vertical, 8)
        .background(selectedColor.selectedColor.accentColor)
        .cornerRadius(56/2)
        .vBottom()
    }
    
    
    
    var vertivalContent: some View {
        VStack(spacing: 16) {
            if !lockMode.lockMode {
                ColorPickerView(selectedColor: selectedColor)
                
                Divider()
                    .frame(width: 40, height: 10)
            }
            
            ColorCellView(selectedColor: selectedColor.selectedColor, hrColor: selectedColor.selectedColor)
        }
    }
}






struct ColorMenu_Previews: PreviewProvider {
    static var previews: some View {
        ColorMenu(selectedColor: SelectedColorViewModel(), orientation: .vertical)
    }
}
