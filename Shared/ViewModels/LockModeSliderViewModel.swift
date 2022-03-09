//
//  LockModeSliderViewModel.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 03/03/2022.
//

import Foundation
import SwiftUI
import Combine


class LockModeSliderViewModel: ObservableObject {
    @Published var displacement: CGFloat = 0
    @Published var lockButtonSize: CGFloat = 44
    @Published var lockButtonPadding: CGFloat = 6
    @Published var appScreenWidth: CGFloat = .zero
    
    
    func sliderLockPosition() {
        // Giving back the lockview button (circle) it's normal size and position if not displaced to the end of the bar
        self.lockButtonSize = 44
        self.lockButtonPadding = 6
        self.displacement = 0
    }
    
    
    func sliderUnlockPosition() {
        // Making the lockview button (circle) bigger when displaced to the end of the bar
        self.lockButtonSize = 56
        self.lockButtonPadding = 0
    }
}
