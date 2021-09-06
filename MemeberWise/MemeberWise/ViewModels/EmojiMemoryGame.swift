//
//  EmojiMemoryGame.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 02/09/2021.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚂", "🚀", "🚁", "🚜", "🛺", "🚲", "🚐", "🛵", "🚘", "🛻", "🏎️", "🚙"]
    
    private static func createMemoryGame() ->  MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { emojis[$0] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [Card] {
        model.cards
    } 
    
    
   // MARK: - User Intents
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    func shuffleCards() {
        model.shuffleCards()
    }
}
