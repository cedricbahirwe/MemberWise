//
//  CardView.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 01/09/2021.
//

import SwiftUI

struct CardView: View {
    init(for card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    let card: MemoryGame<String>.Card
    
    private var rectangleShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: 20)
    }
    var body: some View {
        ZStack {
            if card.isFaceUp {
                rectangleShape
                    .fill()
                    .foregroundColor(Color(.systemBackground))
                rectangleShape
                    .strokeBorder(lineWidth: 3)
                
                Text(card.content)
                    .font(.largeTitle)
            } else {
                rectangleShape.opacity(0.9)
            }
        }t
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(for: .init(content: "🥮", id: 1))
            .padding(10)
            .previewSize(width: 100, height: 150)
    }
}
