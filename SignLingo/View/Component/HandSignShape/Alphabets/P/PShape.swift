//
//  PShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct PShape: Shape {
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
//        path.addLine(to: p(109, 42))
//        path.addQuadCurve(to: p(112, 51), control: p(120, 45))
//        path.addLine(to: p(68, 54))
        
        path.addLine(to: p(60, 43))
        path.addLine(to: p(75, 45))
        path.addQuadCurve(to: p(75, 52), control: p(78, 48))
        path.addQuadCurve(to: p(56, 56), control: p(64, 58))
        
        path.addQuadCurve(to: p(40, 73), control: p(60, 55))
        
        
        
        path.move(to: p(75, 52))
        
        path.addLine(to: p(111, 73))
        path.addQuadCurve(to: p(107, 80), control: p(115, 80))
        
        path.addLine(to: p(74, 64))
        path.addQuadCurve(to: p(60, 65), control: p(65, 60))
//        path.addQuadCurve(to: p(80, 70), control: p(85, 66))
        
        
        
        path.move(to: p(60, 65))
//        path.addLine(to: p(87, 60))
//        path.addQuadCurve(to: p(87, 70), control: p(92, 64))
        
//        path.addLine(to: p(80, 70))
//        path.addQuadCurve(to: p(76, 75), control: p(78, 77))
        
//        path.addLine(to: p(65, 65))
        
//        path.move(to: p(76, 75))
        
//        path.addQuadCurve(to: p(65, 85), control: p(71, 87))
//        path.addQuadCurve(to: p(63, 77), control: p(60, 78))
        path.addQuadCurve(to: p(35, 88), control: p(38, 92))
        path.addLine(to: p(35, 95))
        
        
        path.addQuadCurve(to: p(12, 90), control: p(18, 98))
        
        path.move(to: p(75, 64))
        path.addLine(to: p(64, 74))
        path.addQuadCurve(to: p(47, 80), control: p(40, 96))
        
        
 

        return path
    }
}

struct PShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()

        // main filled hand area
        path.move(to: p(12, 90))
        path.addLine(to: p(12, 75))
        path.addQuadCurve(to: p(56, 33), control: p(46, 33))

        path.addLine(to: p(111, 32))
        path.addQuadCurve(to: p(108, 42), control: p(116, 38))
        path.addLine(to: p(59, 41))

        path.addLine(to: p(60, 43))
        path.addLine(to: p(75, 45))
        path.addQuadCurve(to: p(75, 52), control: p(78, 48))

        path.addLine(to: p(111, 73))
        path.addQuadCurve(to: p(107, 80), control: p(115, 80))
        path.addLine(to: p(74, 64))

        path.addQuadCurve(to: p(60, 65), control: p(65, 60))
        path.addQuadCurve(to: p(35, 88), control: p(38, 92))
        path.addLine(to: p(35, 95))

        path.addQuadCurve(to: p(12, 90), control: p(18, 98))
        path.closeSubpath()

        path.move(to: p(75, 64))
        path.addLine(to: p(64, 74))
        path.addQuadCurve(to: p(47, 80), control: p(40, 96))
        path.addQuadCurve(to: p(60, 65), control: p(48, 70))
        path.addQuadCurve(to: p(75, 64), control: p(68, 61))
        path.closeSubpath()

        return path
    }
}

#Preview("Outline") {
    ZStack {
//        Image("PShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .scaleEffect(x: -1)
//            .background(.black)
        PShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        PShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
