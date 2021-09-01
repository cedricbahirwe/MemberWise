//
//  ContentView.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 31/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var emojis = ["🚂", "🚀", "🚁", "🚜", "🛺", "🚲", "🚐", "🛵", "🚘", "🛻", "🏎️", "🚙"]
    
    @State private var emojiCount = 4
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                    CardView(label: emoji)
                        .frame(minHeight: .infinity)
                }
            }
            HStack {
                Button(action: {
                    withAnimation(.spring()) {
                        if emojiCount > 1 {
                            emojiCount -= 1
                        }
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                })
                Spacer()
                Button("Shuffle") {
                    withAnimation {
                        emojis.shuffle()
                    }
                }
                Spacer()
                Button(action: {
                    withAnimation(.spring()) {
                        if emojiCount < emojis.count {
                            emojiCount += 1
                        }
                        
                    }
                }, label: {
                    Image(systemName: "plus.circle")
                })
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.primary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    let label: String
    @State var isFaceUp = true
    
    private var rectangleShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: 20)
    }
    var body: some View {
        ZStack {
            if isFaceUp {
                rectangleShape
                    .fill()
                    .foregroundColor(Color(.systemBackground))
                rectangleShape
                    .stroke(lineWidth: 3)
                
                Text(label)
                    .font(.largeTitle)
            } else {
                rectangleShape.opacity(0.9)
            }
        }
        .onTapGesture {
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
            isFaceUp.toggle()
        }
        
    }
}
