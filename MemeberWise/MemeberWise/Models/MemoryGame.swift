//
//  MemoryGame.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 02/09/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    
    init(numberOfPairsOfCards: Int,
         createCardContent: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        // Create pairs of card
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    private func index(of card: Card) -> Int{
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            return index
        }
        return 0 // Index out of bounds
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
