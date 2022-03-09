//
//  ColorCellView.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 16/02/2022.
//

import SwiftUI


// MARK: The color cell view
struct ColorCellView: View {
    
    @EnvironmentObject var lockMode: LockModeViewModel
    var selectedColor: HRColor
    var hrColor: HRColor
    
    
    var body: some View {
        ZStack {
            if selectedColor == hrColor {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(lockMode.lockMode ? selectedColor.itemsColor : .blue)
                    .hdShadow2()
            }
            
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .frame(height: selectedColor == hrColor ? 32 : 36)
                    .foregroundColor(hrColor.color)
                    .colorScheme(.dark)
                
                Circle()
                    .trim(from: 0.5, to: 1)
                    .frame(height: selectedColor == hrColor ? 32 : 36)
                    .foregroundColor(hrColor.color)
                    .colorScheme(.light)
            }
        }
        .padding(.vertical, selectedColor == hrColor ? 0 : 2)
        .preferredColorScheme(selectedColor.appearence == .light ? .light : selectedColor.appearence == .dark ? .dark : nil)
    }
}




struct ColorCellView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCellView(selectedColor: HRColor.hrBlack, hrColor: .hrWhite)
    }
}
