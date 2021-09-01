//
//  View+Extensions.swift
//  MemeberWise
//
//  Created by Cédric Bahirwe on 01/09/2021.
//

import SwiftUI

extension View {
    func previewSize(width: CGFloat = 400, height: CGFloat) -> some View {
        previewLayout(.fixed(width: width, height: height))
    }
}
