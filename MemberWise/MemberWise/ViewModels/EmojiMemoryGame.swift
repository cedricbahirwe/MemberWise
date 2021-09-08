//
//  EmojiMemoryGame.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 08/09/2021.
//

import Foundation

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
