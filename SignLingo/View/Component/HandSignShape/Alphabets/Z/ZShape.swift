//
//  ZShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct ZShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(114, 67))
        path.addLine(to: p(79, 38))
        path.addQuadCurve(to: p(23, 26), control: p(26, 29))
        
        path.addQuadCurve(to: p(20, 33), control: p(17, 30))
        
        path.addQuadCurve(to: p(54, 50), control: p(54, 48))
        
        path.addQuadCurve(to: p(61, 63), control: p(63, 58))
        
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

struct ZShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
     
        path.move(to: p(114, 67))
        path.addLine(to: p(79, 38))
        path.addQuadCurve(to: p(23, 26), control: p(26, 29))
        
        path.addQuadCurve(to: p(20, 33), control: p(17, 30))
        
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
        Image("ZShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(.black)
        ZShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        ZShape()
            .stroke(.black, lineWidth: 2)
            .frame(width: 200, height: 200)
            .padding()
    }
}

