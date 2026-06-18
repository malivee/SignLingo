//
//  AShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct AShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(80, 60))
        path.addQuadCurve(to: p(60, 68), control: p(60, 65))
        
        path.move(to: p(80, 89))
        path.addQuadCurve(to: p(65, 89), control: p(66, 92))

        path.move(to: p(80, 113))
        path.addLine(to: p(80, 89))
        path.addQuadCurve(to: p(93, 60), control: p(96, 70))
        path.addQuadCurve(to: p(93, 40), control: p(92, 45))
        path.addLine(to: p(90, 30))
        path.addLine(to: p(91, 20))
        
        path.addQuadCurve(to: p(81, 28), control: p(80, 20))
        path.addQuadCurve(to: p(81, 55), control: p(82, 55))

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

struct AShapeFill: Shape {
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
        path.addQuadCurve(to: p(93, 40), control: p(92, 45))
        path.addLine(to: p(90, 30))
        path.addLine(to: p(91, 20))

        path.addQuadCurve(to: p(81, 28), control: p(80, 20))
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
//        Image("AShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .background(.black)
        AShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        AShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
