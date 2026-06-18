//
//  WShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 16/06/26.
//

import SwiftUI

struct WShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(50, 113))
        path.addLine(to: p(50, 97))
        path.addQuadCurve(to: p(41, 73), control: p(38, 76))
        
        path.addLine(to: p(47, 81))
        path.addQuadCurve(to: p(52, 76), control: p(55, 80))
        
        
        path.addLine(to: p(45, 62))
        
        path.move(to: p(41, 73))
        
        path.addLine(to: p(38, 65))
        path.addQuadCurve(to: p(45, 62), control: p(40, 58))
        
        path.addLine(to: p(27, 23))
        path.addQuadCurve(to: p(35, 19), control: p(25, 15))
        path.addLine(to: p(50, 50))
        
        path.addQuadCurve(to: p(55, 50), control: p(55, 52))
        
        path.addLine(to: p(48, 15))
        path.addQuadCurve(to: p(56, 13), control: p(53, 8))
        path.addLine(to: p(67, 48))
        
        
        path.addQuadCurve(to: p(71, 48), control: p(68, 50))
        path.addLine(to: p(80, 13))
        
        path.addQuadCurve(to: p(89, 14), control: p(85, 10))
        path.addLine(to: p(83, 50))
        path.addLine(to: p(83, 74))
        
        path.addLine(to: p(72, 57))
        path.addLine(to: p(57, 53))
        
        path.addQuadCurve(to: p(57, 64), control: p(47, 58))
        path.addQuadCurve(to: p(65, 67), control: p(63, 69))
        path.addLine(to: p(69, 74))
        
        path.move(to: p(67, 71))
        path.addQuadCurve(to: p(61, 88), control: p(56, 85))
        
        path.move(to: p(83, 74))
        path.addQuadCurve(to: p(76, 99), control: p(83, 77))
        
        path.addLine(to: p(76, 113))
        path.addQuadCurve(to: p(50, 113), control: p(50, 118))
        
        
        
        
 

        return path
    }
}

struct WShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(50, 113))
        path.addLine(to: p(50, 97))
        path.addQuadCurve(to: p(41, 73), control: p(38, 76))
        
        path.addLine(to: p(38, 65))
        path.addQuadCurve(to: p(45, 62), control: p(40, 58))
        
        path.addLine(to: p(27, 23))
        path.addQuadCurve(to: p(35, 19), control: p(25, 15))
        path.addLine(to: p(50, 50))
        
        path.addQuadCurve(to: p(55, 50), control: p(55, 52))
        
        path.addLine(to: p(48, 15))
        path.addQuadCurve(to: p(56, 13), control: p(53, 8))
        path.addLine(to: p(67, 48))
        
//        path.addQuadCurve(to: p(53, 53), control: p(42, 45))
//        
//        path.addLine(to: p(43, 19))
//        path.addQuadCurve(to: p(52, 17), control: p(43, 10))
//        path.addLine(to: p(63, 48))
        
        path.addQuadCurve(to: p(71, 48), control: p(68, 50))
        path.addLine(to: p(80, 13))
        
        path.addQuadCurve(to: p(89, 14), control: p(85, 10))
        path.addLine(to: p(83, 50))
        path.addLine(to: p(83, 74))
        path.addQuadCurve(to: p(76, 99), control: p(83, 77))
        
        path.addLine(to: p(76, 113))
        path.addQuadCurve(to: p(50, 113), control: p(50, 118))


        return path
    }
}

#Preview("Outline") {
    ZStack {
//        Image("VShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .background(.black)
        WShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        WShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
