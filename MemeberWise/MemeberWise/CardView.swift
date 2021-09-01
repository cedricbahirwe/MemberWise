//
//  CardView.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 01/09/2021.
//

import SwiftUI

struct CardView: View {
    internal init(_ label: String) {
        self.title = label
    }
    
    let title: String
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
                    .strokeBorder(lineWidth: 3)
                
                Text(title)
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


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView("🥮")
            .padding(10)
            .previewSize(width: 100, height: 150)
    }
}
