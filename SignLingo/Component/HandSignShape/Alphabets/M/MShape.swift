//
//  MShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 16/06/26.
//

import SwiftUI

struct MShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(56, 117))
        path.addLine(to: p(52, 90))
        
        path.addQuadCurve(to: p(37, 73), control: p(37, 76))
        path.addLine(to: p(35, 55))
        path.addQuadCurve(to: p(43, 47), control: p(41, 45))
        
        path.move(to: p(48, 34))
        path.addQuadCurve(to: p(48, 57), control: p(44, 57))
        path.addQuadCurve(to: p(57, 57), control: p(57, 68))
        
        path.move(to: p(50, 67))
        path.addQuadCurve(to: p(45, 56), control: p(43, 56))
        
        path.move(to: p(77, 77))
        path.addQuadCurve(to: p(57, 67), control: p(67, 67))
        
        
//        path.addLine(to: p(50, 67))
        
//        path.addLine(to: p(59, 47))
        
//        path.addQuadCurve(to: p(56, 59), control: p(66, 54))
//        path.addLine(to: p(47, 59))
//        path.move(to: p(50, 59))
//        path.addQuadCurve(to: p(50, 67), control: p(52, 63))
        
        path.move(to: p(43, 47))
        path.addLine(to: p(48, 34))
        path.addQuadCurve(to: p(58, 37), control: p(54, 30))
        
        path.addLine(to: p(57, 59))
        path.move(to: p(58, 37))
        
        path.addQuadCurve(to: p(68, 37), control: p(64, 30))
        path.addLine(to: p(68, 60))
        path.addQuadCurve(to: p(57, 59), control: p(63, 67))
        path.move(to: p(68, 37))
        
        path.addQuadCurve(to: p(77, 40), control: p(75, 34))
        path.addLine(to: p(77, 58))
        path.addQuadCurve(to: p(68, 58), control: p(73, 68))
        path.move(to: p(77, 40))
        
//        path.addQuadCurve(to: p(86, 40), control: p(80, 35))
        path.addQuadCurve(to: p(82, 35), control: p(78, 34))
        path.addQuadCurve(to: p(88, 44), control: p(94, 30))
        path.addLine(to: p(78, 48))
        path.addLine(to: p(83, 46))
        path.addLine(to: p(86, 55))
        
        path.move(to: p(78, 58))
        path.addQuadCurve(to: p(86, 58), control: p(81, 68))
//        path.addLine(to: p(86, 55))
        
//        path.addQuadCurve(to: p(77, 55), control: p(80, 66))
        
        path.move(to: p(86, 55))

        
        path.addQuadCurve(to: p(84, 90), control: p(87, 83))
        
        path.addLine(to: p(88, 117))
        
        path.addQuadCurve(to: p(56, 117), control: p(56, 127))
        
        
        
 

        return path
    }
}

struct MShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(56, 117))
        path.addLine(to: p(52, 90))
        
        path.addQuadCurve(to: p(37, 73), control: p(37, 76))
        path.addLine(to: p(35, 55))
        path.addQuadCurve(to: p(43, 47), control: p(41, 45))
        path.addLine(to: p(48, 34))
        path.addQuadCurve(to: p(58, 37), control: p(54, 30))
        
        path.addQuadCurve(to: p(68, 37), control: p(64, 30))
        path.addQuadCurve(to: p(77, 40), control: p(75, 34))
        
//        path.addQuadCurve(to: p(86, 40), control: p(80, 35))
//        path.addLine(to: p(86, 55))
        path.addQuadCurve(to: p(82, 35), control: p(78, 34))
        path.addQuadCurve(to: p(88, 44), control: p(94, 30))
        path.addLine(to: p(78, 48))
        path.addLine(to: p(83, 46))
        path.addLine(to: p(86, 55))
        
        path.addQuadCurve(to: p(84, 90), control: p(87, 83))
        
        path.addLine(to: p(88, 117))
        
        path.addQuadCurve(to: p(56, 117), control: p(56, 127))


        return path
    }
}

#Preview("Outline") {
    ZStack {
//        Image("IShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .scaleEffect(x: -1)
//            .background(.black)
        MShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .scaleEffect(x: -1)
            .padding()
        MShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .scaleEffect(x: -1)
            .padding()
    }
}
