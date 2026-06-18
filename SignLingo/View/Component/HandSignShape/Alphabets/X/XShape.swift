//
//  XShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct XShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(114, 67))
        path.addQuadCurve(to: p(79, 35), control: p(87, 39))
        path.addQuadCurve(to: p(65, 16), control: p(67, 16))
        
//        path.addQuadCurve(to: p(20, 33), control: p(17, 30))
        path.addQuadCurve(to: p(36, 16), control: p(36, 14))
        path.addLine(to: p(26, 20))
        path.addQuadCurve(to: p(25, 30), control: p(20, 25))
        
        path.addQuadCurve(to: p(36, 30), control: p(30, 32))
        path.addQuadCurve(to: p(55, 30), control: p(58, 32))
        path.addQuadCurve(to: p(65, 40), control: p(63, 40))
        
        path.addQuadCurve(to: p(54, 50), control: p(54, 48))
        
        
        path.move(to: p(54, 61))
        
        path.addQuadCurve(to: p(63, 65), control: p(65, 64))
        
        path.move(to: p(54, 50))
        
        path.addLine(to: p(43, 62))
        path.addLine(to: p(50, 68))
        
        path.addQuadCurve(to: p(67, 61), control: p(67, 67))
        path.move(to: p(64, 63))
        path.addLine(to: p(65, 52))
        
        path.move(to: p(50, 68))
        
        path.addQuadCurve(to: p(48, 82), control: p(40, 75))
        path.addLine(to: p(68, 82))
        
        path.addQuadCurve(to: p(99, 88), control: p(83, 90))
        path.addLine(to: p(110, 93))
        
        path.addQuadCurve(to: p(114, 67), control: p(120, 67))
        
      
        
        
        
        
        
 

        return path
    }
}

struct XShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
     
        path.move(to: p(114, 67))
        path.addQuadCurve(to: p(79, 35), control: p(87, 39))
        path.addQuadCurve(to: p(65, 16), control: p(67, 16))
        
//        path.addQuadCurve(to: p(20, 33), control: p(17, 30))
        path.addQuadCurve(to: p(36, 16), control: p(36, 14))
        path.addLine(to: p(26, 20))
        path.addQuadCurve(to: p(25, 30), control: p(20, 25))
        
        path.addQuadCurve(to: p(36, 30), control: p(30, 32))
        path.addQuadCurve(to: p(55, 30), control: p(58, 32))
        path.addQuadCurve(to: p(65, 40), control: p(63, 40))
        
        path.addQuadCurve(to: p(54, 50), control: p(54, 48))
        
        
        path.addLine(to: p(43, 62))
        path.addLine(to: p(50, 68))
        
        path.addQuadCurve(to: p(48, 82), control: p(40, 75))
        path.addLine(to: p(68, 82))
        
        path.addQuadCurve(to: p(99, 88), control: p(83, 90))
        path.addLine(to: p(110, 93))
        
        path.addQuadCurve(to: p(114, 67), control: p(120, 67))

        return path
    }
}

#Preview("Outline") {
    ZStack {
//        Image("XShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .background(.black)
        XShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        XShape()
            .stroke(.black, lineWidth: 2)
            .frame(width: 200, height: 200)
            .padding()
    }
}

