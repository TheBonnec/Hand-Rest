//
//  LockModeViewModel.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 17/02/2022.
//

import Foundation
import SwiftUI
import Combine



class LockModeViewModel: ObservableObject {
    @Published var lockMode: Bool = false
    
    func lock() {
        self.lockMode = true
    }
    
    func unlock() {
        self.lockMode = false
    }
}
