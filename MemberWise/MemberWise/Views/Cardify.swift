//
//  Cardify.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 23/09/2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    private let rectangleShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                if isFaceUp {
                    rectangleShape
                        .fill()
                        .foregroundColor(Color(.systemBackground))
                    rectangleShape
                        .strokeBorder(lineWidth: DrawingConstants.linewidth)
                    
                    content
                } else {
                    rectangleShape.opacity(0.9)
                }
            }
        }
    }
    
    private enum DrawingConstants {
        static let cornerRadius: CGFloat  = 10
        static let linewidth: CGFloat = 3
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
