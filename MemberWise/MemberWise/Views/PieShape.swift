//
//  PieShape.swift
//  MemberWise
//
//  Created by Cédric Bahirwe on 08/09/2021.
//

import SwiftUI


struct PieShape: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY )
        let radius = min(rect.width, rect.height)  / 2
        
        var p = Path()
        
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        
        p.move(to: center)
        p.addLine(to: start)
        
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: !clockwise)
        return p
    }
}


struct P_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PieShape(startAngle: .degrees(270), endAngle: .degrees(0))

        }
        .frame(width: 100, height: 180)
        .background(Color.red)
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
