//
//  EShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct EShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127
        
        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }
        
        var path = Path()
        
        path.move(to: p(81, 28))
        path.addQuadCurve(to: p(81, 55), control: p(80, 55))
        
        path.move(to: p(81, 28))
        path.addQuadCurve(to: p(85, 55), control: p(90, 55))
        
        
        path.move(to: p(80, 89))
        path.addQuadCurve(to: p(65, 89), control: p(66, 92))
        
        path.move(to: p(80, 113))
        path.addLine(to: p(80, 89))
        path.addQuadCurve(to: p(93, 60), control: p(96, 70))

        path.addQuadCurve(to: p(81, 55), control: p(81, 50))
        path.addQuadCurve(to: p(64, 65), control: p(61, 63))
        path.addQuadCurve(to: p(64, 75), control: p(60, 70))
        path.addQuadCurve(to: p(83, 72), control: p(80, 78))
        path.move(to: p(80, 74))
        path.addQuadCurve(to: p(84, 79), control: p(80, 79))
        
        path.move(to: p(81, 28))
        path.addQuadCurve(to: p(70, 28), control: p(75, 20))
        path.addQuadCurve(to: p(72, 55), control: p(69, 53))
        path.addQuadCurve(to: p(80, 55), control: p(80, 60))
        
        
        path.move(to: p(70, 28))
        path.addQuadCurve(to: p(55, 32), control: p(60, 20))
        path.addQuadCurve(to: p(62, 60), control: p(60, 60))
        path.addQuadCurve(to: p(72, 55), control: p(73, 63))
        
        path.move(to: p(55, 32))
        path.addQuadCurve(to: p(45, 40), control: p(45, 30))
        path.addLine(to: p(55, 65))
        path.addQuadCurve(to: p(62, 60), control: p(62, 65))
        
        path.move(to: p(45, 40))
        path.addQuadCurve(to: p(35, 50), control: p(35, 35))
        
        path.move(to: p(39, 50))
        path.addQuadCurve(to: p(46, 66), control: p(46, 66))
        path.addQuadCurve(to: p(54, 63), control: p(54, 68))
        
        
        path.move(to: p(35, 50))
        path.addQuadCurve(to: p(35, 50), control: p(35, 35))
        path.addLine(to: p(33, 60))
        path.addQuadCurve(to: p(35, 73), control: p(35, 70))
        path.addQuadCurve(to: p(44, 95), control: p(40, 95))
        path.addLine(to: p(44, 113))
        path.addQuadCurve(to: p(80, 113), control: p(75, 120))
        
        
        
        
        return path
    }
}

struct EShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127
        
        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }
        
        var path = Path()

        path.move(to: p(80, 113))
        path.addLine(to: p(80, 89))
        path.addQuadCurve(to: p(93, 60), control: p(96, 70))

        path.addQuadCurve(to: p(85, 55), control: p(85, 52))
        path.addQuadCurve(to: p(81, 28), control: p(88, 35))

        path.addQuadCurve(to: p(70, 28), control: p(75, 20))
        path.addQuadCurve(to: p(55, 32), control: p(60, 20))
        path.addQuadCurve(to: p(45, 40), control: p(45, 30))
        path.addQuadCurve(to: p(35, 50), control: p(35, 35))

        path.addLine(to: p(33, 60))
        path.addQuadCurve(to: p(35, 73), control: p(35, 70))
        path.addQuadCurve(to: p(44, 95), control: p(40, 95))
        path.addLine(to: p(44, 113))

        path.addQuadCurve(to: p(80, 113), control: p(75, 120))

        path.closeSubpath()
        return path
    }
}



#Preview("Outline") {
    ZStack {
        //        Image("EShape")
        //            .resizable()
        //            .scaledToFit()
        //            .frame(width: 200, height: 200)
        //            .offset(y: 15)
        //            .background(.black)
        EShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        EShape()
            .stroke(.black, lineWidth: 1)
            .frame(width: 200, height: 200)
            .padding()
    }
}
