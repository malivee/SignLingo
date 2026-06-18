//
//  GShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 16/06/26.
//

import SwiftUI

struct GShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(27, 100))
        path.addLine(to: p(27, 82))
        path.addLine(to: p(45, 33))
        
        path.addQuadCurve(to: p(50, 32), control: p(49, 31))
        path.addLine(to: p(107, 26))
        path.addQuadCurve(to: p(105, 33), control: p(107, 33))
        
        path.addQuadCurve(to: p(84, 41), control: p(84, 43))
        
        path.addQuadCurve(to: p(79, 31), control: p(84, 33))
        
        
        path.move(to: p(84, 41))
        path.addQuadCurve(to: p(84, 51), control: p(86, 51))
        
        path.addQuadCurve(to: p(77, 57), control: p(81, 59))
        path.addLine(to: p(78, 43))
        path.addQuadCurve(to: p(70, 40), control: p(73, 39))
        path.addLine(to: p(55, 39))
        path.move(to: p(77, 57))
        
        path.addQuadCurve(to: p(71, 63), control: p(74, 65))
        path.addLine(to: p(69, 52))
        path.addLine(to: p(52, 50))
        path.move(to: p(71, 63))
        
        path.addQuadCurve(to: p(58, 69), control: p(65, 71))
        
        path.addQuadCurve(to: p(58, 63), control: p(56, 69))
        path.addQuadCurve(to: p(63, 61), control: p(66, 63))
        
        path.move(to: p(59, 63))
        path.addQuadCurve(to: p(62, 66), control: p(65, 69))
        
        path.move(to: p(84, 51))
        path.addLine(to: p(97, 49))
        path.addQuadCurve(to: p(99, 60), control: p(109, 49))
        path.addLine(to: p(80, 64))
        path.addQuadCurve(to: p(76, 68), control: p(74, 68))
        path.addQuadCurve(to: p(57, 80), control: p(60, 84))
        
        path.addQuadCurve(to: p(52, 100), control: p(49, 95))
        path.addQuadCurve(to: p(27, 100), control: p(27, 105))
 

        return path
    }
}

struct GShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(27, 100))
        path.addLine(to: p(27, 82))
        path.addLine(to: p(45, 33))
        
        path.addQuadCurve(to: p(50, 32), control: p(49, 31))
        path.addLine(to: p(107, 26))
        path.addQuadCurve(to: p(105, 33), control: p(107, 33))
        
        path.addQuadCurve(to: p(84, 41), control: p(84, 43))
        
        path.addQuadCurve(to: p(84, 51), control: p(86, 51))
        path.addLine(to: p(97, 49))
        path.addQuadCurve(to: p(99, 60), control: p(109, 49))
        path.addLine(to: p(80, 64))
        path.addQuadCurve(to: p(76, 68), control: p(74, 68))
        path.addQuadCurve(to: p(57, 80), control: p(60, 84))
        
        path.addQuadCurve(to: p(52, 100), control: p(49, 95))
        path.addQuadCurve(to: p(27, 100), control: p(27, 105))

        return path
    }
}

#Preview("Outline") {
    ZStack {
        Image("GShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(.black)
        GShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        GShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}

