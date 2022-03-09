//
//  Hand_RestApp.swift
//  Shared
//
//  Created by Thomas Le Bonnec on 16/02/2022.
//

import SwiftUI

@main
struct Hand_RestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LockModeViewModel())
        }
    }
}
