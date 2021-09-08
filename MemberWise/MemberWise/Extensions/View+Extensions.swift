//
//  View+Extensions.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 08/09/2021.
//

import SwiftUI

extension View {
    func previewSize(width: CGFloat = 400, height: CGFloat) -> some View {
        previewLayout(.fixed(width: width, height: height))
    }
}
