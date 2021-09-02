//
//  TestingView.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 02/09/2021.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        List {
            Text("item.rawValue")
                .font(.system(size: 25))
            ForEach(CustomFont.allCases, id:\.rawValue) { item in
                Text(item.rawValue)
                    .font(.proxima(item, 25))
                
            }
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
