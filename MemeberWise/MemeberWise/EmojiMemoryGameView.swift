//
//  EmojiMemoryGameView.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 06/09/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    @State private var emojiCount = 4
    
    private let columns =  [GridItem(.adaptive(minimum: 70))]
    var body: some View {
        VStack {
            Text("MemberWise")
                .font(.proxima(.black, 40))
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(game.cards) { card in
                        CardView(for: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                makeSelectionSound()
                                game.choose(card)
                            }
                    }
                }
            }
            
            Spacer()
            HStack {
                removeButton
                Spacer()
                Button("Shuffle") {
                    withAnimation {
                        game.shuffleCards()
                    }
                }
                .font(.system(.title, design: .monospaced))
                Spacer()
                addButton
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    private var removeButton: some View {
        Button(action: {
            withAnimation(.spring()) {
                if emojiCount < game.cards.count {
                    emojiCount += 1
                }
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    private var addButton: some View {
        Button(action: {
            withAnimation(.spring()) {
                if emojiCount > 1 {
                    emojiCount -= 1
                }
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    private func makeSelectionSound() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        
    }
}
