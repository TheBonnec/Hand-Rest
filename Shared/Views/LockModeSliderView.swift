//
//  LockModeSliderView.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 17/02/2022.
//

import SwiftUI


// MARK: The slider to unlock the view
struct LockModeSliderView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var lockMode: LockModeViewModel
    @StateObject var viewModel = LockModeSliderViewModel()
    var selectedColor: HRColor
    
    
    var body: some View {
        ZStack {
            GeometryReader { geometry -> AnyView in
                DispatchQueue.main.async {
                    self.viewModel.appScreenWidth = geometry.frame(in: .global).width
                }
                return AnyView(
                    Text("")
                        .frame(width: 0, height: 0)
                )
            }
            
            
            // Bar
            selectedColor.accentColor
                .cornerRadius(56/2)
                .hCenter()
                .padding(.leading, viewModel.displacement)
            
            
            // Slide bar background
            HStack(spacing: 0) {
                // Invisible bar
                ZStack {
                    Text("Slider-text")
                        .font(.body)
                        .foregroundColor(selectedColor.itemsColor)
                        .frame(height: 30)
                        .padding(6)
                        .offset(x: 44/3)
                        .opacity(viewModel.displacement < 50 ? Double((50 - viewModel.displacement) / 50) : 0)
                    
                    selectedColor.color
                        .frame(width: viewModel.displacement, height: 56)
                        .hLeading()
                }
            }
            
            
            // Lock Button
            GeometryReader { geometry in
                ZStack {
                    Circle()
                        .foregroundColor(lockMode.lockMode ? selectedColor.itemsColor : Color.blue)
                        .frame(width: viewModel.lockButtonSize)
                    
                    Image(systemName: self.lockMode.lockMode == true ? "lock" : "lock.open")
                        .font(.title3.weight(.medium))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .offset(x: viewModel.displacement)
                .gesture(!lockMode.lockMode ? nil : DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        self.viewModel.displacement = max(min(CGFloat(value.location.x-22), geometry.size.width - 44), 0)
                        print(self.viewModel.displacement)
                    })
                    .onEnded({ value in
                        withAnimation {
                            if viewModel.displacement != geometry.size.width - 44 {
                                self.viewModel.sliderLockPosition()
                                self.lockMode.lock()
                            } else {
                                self.viewModel.sliderUnlockPosition()
                                self.lockMode.unlock()
                            }
                        }
                    })
                )
                .onTapGesture {
                    withAnimation {
                        self.viewModel.sliderLockPosition()
                        self.lockMode.lock()
                    }
                }
            }
            .padding(.horizontal, viewModel.lockButtonPadding)
        }
        .frame(height: 56)
        // Reset slider's position if view size is changed and lock it if horizontalSizeClass becomes / is compact
        .onChange(of: viewModel.appScreenWidth) { newValue in
            self.viewModel.sliderLockPosition()
            if self.horizontalSizeClass == .compact {
                self.lockMode.lock()
            }
        }
    }
}





struct LockModeSliderView_Previews: PreviewProvider {
    static var previews: some View {
        LockModeSliderView(selectedColor: HRColor.hrDynamic)
    }
}
