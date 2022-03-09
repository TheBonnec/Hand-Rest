//
//  View+Extensions.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 16/02/2022.
//

import Foundation
import SwiftUI


extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    func vTop() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .top)
    }
    func vBottom() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .bottomTrailing)
    }
    func vCenter() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .center)
    }
}




    
extension View {
    func hdShadow() -> some View {
        self
            .shadow(color: Color(uiColor: .black).opacity(0.2), radius: 6)
    }
    func hdShadow2() -> some View {
        self
            .shadow(color: Color(uiColor: .black).opacity(0.1), radius: 6)
    }
}





extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
            clipShape( RoundedCorner(radius: radius, corners: corners) )
        }
}
