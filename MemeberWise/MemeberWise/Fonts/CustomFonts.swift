//
//  CustomFonts.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 02/09/2021.
//

import SwiftUI

public enum CustomFont: String, CaseIterable {
    case thin = "ProximaNova-Thin"
    case altThin = "ProximaNova-Alt-Thin"

    case semiBold = "ProximaNova-Semibold"
    case altBold = "ProximaNova-Alt-Bold"
    case extraBold = "ProximaNova-Extrabold"

    case regular = "ProximaNova-Regular"
    case altLight = "ProximaNova-Alt-Light"
    case black = "ProximaNova-Black"
}

public extension Font {
    static func proxima(_ name: CustomFont, _ size: CGFloat) -> Font {
        .custom(name.rawValue, size: size)
    }
}
