//
//  QShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct QShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(23,34))
        path.addQuadCurve(to: p(77, 40), control: p(66, 33))
        path.addLine(to: p(95, 91))
        
        path.addQuadCurve(to: p(87, 92), control: p(92, 97))
        path.addLine(to: p(76, 67))
        path.addQuadCurve(to: p(64, 72), control: p(74, 82))
        
        path.addLine(to: p(63, 66))
        path.addLine(to: p(70, 56))
        
        path.move(to: p(66, 60))
        
        path.addQuadCurve(to: p(74, 63), control: p(70, 64))
        path.addLine(to: p(76, 67))
        
        path.move(to: p(64, 72))
        
        path.addLine(to: p(69, 87))
        path.addQuadCurve(to: p(60, 90), control: p(72, 95))
        
        path.addQuadCurve(to: p(22, 58), control: p(28, 50))
        
        path.addQuadCurve(to: p(23, 34), control: p(18, 34))
        
        
 

        return path
    }
}

struct QShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(23,34))
        path.addQuadCurve(to: p(77, 40), control: p(66, 33))
        path.addLine(to: p(95, 91))
        
        path.addQuadCurve(to: p(87, 92), control: p(92, 97))
        path.addLine(to: p(76, 67))
        path.addQuadCurve(to: p(64, 72), control: p(74, 82))
        
        path.addLine(to: p(69, 87))
        path.addQuadCurve(to: p(60, 90), control: p(72, 95))
        
        path.addQuadCurve(to: p(22, 58), control: p(28, 50))
        
        path.addQuadCurve(to: p(23, 34), control: p(18, 34))

        return path
    }
}

#Preview("Outline") {
    ZStack {
        Image("QShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .scaleEffect(x: -1)
            .background(.black)
        QShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        QShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
