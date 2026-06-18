//
//  BShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct BShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(79, 113))
        path.addLine(to: p(79, 102))
        path.addQuadCurve(to: p(88, 73), control: p(93, 78))
        path.addLine(to: p(74, 59))
        path.addQuadCurve(to: p(55, 65), control: p(65, 60))
        path.addQuadCurve(to: p(55, 70), control: p(54, 70))
        path.addQuadCurve(to: p(73, 72), control: p(68, 79))
        
        path.move(to: p(67, 75))
        path.addQuadCurve(to: p(76, 80), control: p(74, 82))
        
        path.move(to: p(70, 78))
        path.addQuadCurve(to: p(76, 85), control: p(76, 89))
        
        path.move(to: p(84, 69))
        path.addLine(to: p(80, 17))
        path.addQuadCurve(to: p(69, 22), control: p(74, 7))
        
        path.addLine(to: p(72, 55))
        
        path.addLine(to: p(67, 12))
        path.addQuadCurve(to: p(58, 15), control: p(60, 6))
        path.addLine(to: p(58, 34))
        
        path.move(to: p(58, 34))
        path.addLine(to: p(60, 55))

        path.addLine(to: p(55, 18))
        path.addQuadCurve(to: p(47, 22), control: p(48, 12))
        path.addLine(to: p(48, 45))
        path.addLine(to: p(50, 60))

        path.move(to: p(48, 45))
        
        path.addQuadCurve(to: p(39, 45), control: p(42, 35))
        path.addLine(to: p(41, 68))
        
        path.addQuadCurve(to: p(50, 104), control: p(42, 96))
        path.addLine(to: p(50, 114))
        path.addQuadCurve(to: p(79, 113), control: p(79, 120))
        
        path.move(to: p(62, 94))
        path.addQuadCurve(to: p(65, 76), control: p(63, 74))
        
 

        return path
    }
}


struct BShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(79, 113))
        path.addLine(to: p(79, 102))
        path.addQuadCurve(to: p(88, 73), control: p(93, 78))
        path.addLine(to: p(84, 69))
        path.addLine(to: p(80, 17))
        path.addQuadCurve(to: p(69, 22), control: p(74, 7))
        
//        path.addLine(to: p(72, 55))
        
        path.addLine(to: p(67, 12))
        path.addQuadCurve(to: p(58, 15), control: p(60, 6))
        path.addLine(to: p(58, 34))

        path.addLine(to: p(55, 18))
        path.addQuadCurve(to: p(47, 22), control: p(48, 12))
        path.addLine(to: p(48, 45))
        
        path.addQuadCurve(to: p(39, 45), control: p(42, 35))
        path.addLine(to: p(41, 68))
        
        path.addQuadCurve(to: p(50, 104), control: p(42, 96))
        path.addLine(to: p(50, 114))
        path.addQuadCurve(to: p(79, 113), control: p(79, 120))

        return path
    }
}



#Preview("Outline") {
    ZStack {
        Image("BShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(.black)
        BShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        BShape()
            .stroke(.black, lineWidth: 2)
            .frame(width: 200, height: 200)
            .padding()
    }
}
