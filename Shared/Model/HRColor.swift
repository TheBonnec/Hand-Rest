//
//  HRColor.swift
//  Hand Rest
//
//  Created by Thomas Le Bonnec on 16/02/2022.
//

import Foundation
import SwiftUI


struct HRColor: Hashable {
    var hrColorEnum: HRColorEnum
    var appearence: hrAppearance
    var color: Color        // The color used for the background
    var itemsColor: Color   // The color used for the items and texts
    var accentColor: Color  // The color used for the items background
}



extension HRColor {
    public static var hrBlack: HRColor {
        return HRColor(hrColorEnum: .hrBlack, appearence: .dark, color: .hrBlack, itemsColor: .hrBlackItemColor, accentColor: .hrBlackAccentColor)
    }
    public static var hrGray: HRColor {
        return HRColor(hrColorEnum: .hrGray, appearence: .light, color: .hrGray, itemsColor: .hrGrayItemColor, accentColor: .hrGrayAccentColor)
    }
    public static var hrWhite: HRColor {
        return HRColor(hrColorEnum: .hrWhite, appearence: .light, color: .hrWhite, itemsColor: .hrWhiteItemColor, accentColor: .hrWhiteAccentColor)
    }
    public static var hrDynamic: HRColor {
        return HRColor(hrColorEnum: .hrDynamic, appearence: .adaptive, color: .hrDynamic, itemsColor: .hrDynamicItemColor, accentColor: .hrDynamicAccentColor)
    }
}



enum hrAppearance {
    case light, dark, adaptive
}
