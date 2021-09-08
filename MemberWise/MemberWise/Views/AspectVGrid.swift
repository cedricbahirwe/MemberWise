//
//  AspectVGrid.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 08/09/2021.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View
where Item: Identifiable, ItemView: View { 
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    var body: some View {
        
        let width: CGFloat = 100
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]) {
            ForEach(items) { item in
                content(item)
                    .aspectRatio(aspectRatio,contentMode: .fit)
            }
        }
    }
}
