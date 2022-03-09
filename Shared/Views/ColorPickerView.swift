//
//  ColorPickerView.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 17/02/2022.
//

import SwiftUI


// MARK: The list of all possible backround colors
struct ColorPickerView: View {
    
    @ObservedObject var selectedColor: SelectedColorViewModel
    let colorList: [HRColor] = [.hrBlack, .hrGray, .hrWhite, .hrDynamic]
    var orientation: Orientation = .vertical
    
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(colorList, id: \.self) { color in
                ColorCellView(selectedColor: selectedColor.selectedColor, hrColor: color)
                    .onTapGesture {
                        withAnimation {
                            self.selectedColor.changeSelectedColor(newSelectedColor: color)
                        }
                    }
            }
        }
    }
}





struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: SelectedColorViewModel())
    }
}
