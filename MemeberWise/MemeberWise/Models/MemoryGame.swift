//
//  MemoryGame.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 02/09/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    
    func choose(card: Card) {}
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
