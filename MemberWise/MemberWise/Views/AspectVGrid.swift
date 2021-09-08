//
//  AspectVGrid.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 08/09/2021.
//

import SwiftUI

struct AspectVGrid<Item, Content>: View where Content: View {
    internal init(items: [Item],
                  aspectRatio: CGFloat,
                  @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> Content
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct AspectVGrid_Previews: PreviewProvider {
    static var previews: some View {
        AspectVGrid(items: [], aspectRatio: 2/3) { card in
            VStack { }
        }
    }
}
