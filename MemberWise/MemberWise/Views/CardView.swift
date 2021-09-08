//
//  CardView.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 08/09/2021.
//

import SwiftUI

struct CardView: View {
    init(for card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    private let card: EmojiMemoryGame.Card
    
    private var rectangleShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    rectangleShape
                        .fill()
                        .foregroundColor(Color(.systemBackground))
                    rectangleShape
                        .strokeBorder(lineWidth: DrawingConstants.linewidth)
                    
                    PieShape(startAngle: .degrees(-90), endAngle: .degrees(110-90))
                        .padding(5).opacity(0.9)
                    
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else {
                    rectangleShape.opacity(card.isMatched ? 0 : 0.9)
                }
            }
        }
    }
    
    private enum DrawingConstants {
        static let cornerRadius: CGFloat  = 10
        static let linewidth: CGFloat = 3
        static let fontScale: CGFloat = 0.6
    }
    
    private func font(in size: CGSize) -> Font {
        .system(size: min(size.width, size.height)*DrawingConstants.fontScale)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(for: .init(content: "🥮", id: 1))
            .padding(10)
            .previewSize(width: 100, height: 150)
    }
}
