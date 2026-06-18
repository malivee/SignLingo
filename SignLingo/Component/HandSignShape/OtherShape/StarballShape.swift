//
//  StarballShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 18/06/26.
//

import SwiftUI

// MARK: not finished
struct StarballShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(
                    x: rect.midX,
                    y: rect.midY
                )
        let outerRadius = min(rect.width, rect.height) * 0.5
                let innerRadius = outerRadius * 0.4
        var path = Path()

               for i in 0..<10 {
                   let angle = Double(i) * .pi / 5 - .pi / 2
                   let radius = i.isMultiple(of: 2)
                       ? outerRadius
                       : innerRadius

                   let point = CGPoint(
                       x: center.x + cos(angle) * radius,
                       y: center.y + sin(angle) * radius
                   )

                   if i == 0 {
                       path.move(to: point)
                   } else {
                       path.addLine(to: point)
                   }
               }

               path.closeSubpath()
        
        return path

    }
}

#Preview {
    ZStack {
        StarballShape()
    }
}
