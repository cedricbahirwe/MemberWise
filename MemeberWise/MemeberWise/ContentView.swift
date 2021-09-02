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
    
    private let columns =  [GridItem(.adaptive(minimum: 70))]
    var body: some View {
        VStack(spacing: 0) {
            Text("MemberWise")
                .font(.proxima(.black, 40))
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                        CardView(emoji)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                }
            }

            Spacer()
            HStack {
                removeButton
                Spacer()
                Button("Shuffle") {
                    withAnimation {
                        emojis.shuffle()
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
                if emojiCount < emojis.count {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

