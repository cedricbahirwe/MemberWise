//
//  MemoryGame.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 02/09/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    
    private var indexOfTheOnlyFaceUpCard: Int? {
        get {
            let indices = cards.indices.filter({ cards[$0].isFaceUp })
            return indices.count == 1 ? indices.first : nil
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    init(numberOfPairsOfCards: Int,
         createCardContent: (Int) -> CardContent) {
        
        cards = []
        
        // Create pairs of card
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    
    /// Choose a selected card
    /// - Parameter card: the selected card from the stack
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
           {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func shuffleCards() {
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}
