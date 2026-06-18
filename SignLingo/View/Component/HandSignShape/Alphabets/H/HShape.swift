//
//  HShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 16/06/26.
//

import SwiftUI

struct HShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(12, 90))
        path.addLine(to: p(12, 75))
        path.addQuadCurve(to: p(56, 33), control: p(46, 33))
        
        path.addLine(to: p(111, 32))
        path.addQuadCurve(to: p(108, 42), control: p(116, 38))
        path.addLine(to: p(59, 41))
        path.addLine(to: p(109, 42))
        path.addQuadCurve(to: p(112, 51), control: p(120, 45))
        path.addLine(to: p(68, 54))
        
        path.addLine(to: p(79, 59))
        path.addQuadCurve(to: p(80, 70), control: p(85, 66))
        
        path.move(to: p(79, 59))
        path.addLine(to: p(87, 60))
        path.addQuadCurve(to: p(87, 70), control: p(92, 64))
        
        path.addLine(to: p(80, 70))
        path.addQuadCurve(to: p(76, 75), control: p(78, 77))
        
        path.addLine(to: p(65, 65))
        
        path.move(to: p(76, 75))
        
        path.addQuadCurve(to: p(65, 85), control: p(71, 87))
        path.addQuadCurve(to: p(63, 77), control: p(60, 78))
        path.addQuadCurve(to: p(35, 88), control: p(38, 92))
        path.addLine(to: p(35, 95))
        
        path.addQuadCurve(to: p(12, 90), control: p(18, 98))
        
        
 

        return path
    }
}

struct HShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(12, 90))
        path.addLine(to: p(12, 75))
        path.addQuadCurve(to: p(56, 33), control: p(46, 33))
        
        path.addLine(to: p(111, 32))
        path.addQuadCurve(to: p(108, 42), control: p(116, 38))
        path.addLine(to: p(59, 41))
        path.addLine(to: p(109, 42))
        path.addQuadCurve(to: p(112, 51), control: p(120, 45))
        path.addLine(to: p(68, 54))
        
        path.addLine(to: p(79, 59))
        path.addLine(to: p(87, 60))
        path.addQuadCurve(to: p(87, 70), control: p(92, 64))
        
        path.addLine(to: p(80, 70))
        path.addQuadCurve(to: p(76, 75), control: p(78, 77))
        
        path.addQuadCurve(to: p(65, 85), control: p(71, 87))
        path.addQuadCurve(to: p(63, 77), control: p(60, 78))
        path.addQuadCurve(to: p(35, 88), control: p(38, 92))
        path.addLine(to: p(35, 95))
        
        path.addQuadCurve(to: p(12, 90), control: p(18, 98))

        return path
    }
}

#Preview("Outline") {
    ZStack {
        Image("HShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(.black)
        HShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        HShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
