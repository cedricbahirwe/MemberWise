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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                PieShape(startAngle: .degrees(-90), endAngle: .degrees(110-90))
                    .padding(5).opacity(0.75)
                
                Text(card.content)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false))
                    .font(font(in: geometry.size))
                    .animation(nil)

            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
     
    private enum DrawingConstants {
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
