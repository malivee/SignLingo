//
//  DShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct DShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(41, 115))
        path.addLine(to: p(41, 98))
        path.addLine(to: p(48, 60))
        path.addQuadCurve(to: p(58, 11), control: p(58, 19))
        
        path.addQuadCurve(to: p(65, 13), control: p(62, 9))
        path.addQuadCurve(to: p(64, 50), control: p(65, 52))
        path.addLine(to: p(57, 53))
        path.move(to: p(64, 50))
        
        path.addLine(to: p(80, 45))
        path.addQuadCurve(to: p(92, 58), control: p(90, 52))
        path.addLine(to: p(91, 65))
        
        path.addQuadCurve(to: p(92, 73), control: p(100, 64))
        path.addLine(to: p(88, 74))
        path.addLine(to: p(89, 69))
        path.addQuadCurve(to: p(81, 56), control: p(83, 55))
        path.addQuadCurve(to: p(63, 58), control: p(63, 61))
        
        path.move(to: p(89, 69))
        path.addQuadCurve(to: p(91, 65), control: p(92, 66))
        
        path.move(to: p(88, 74))
        
        path.addLine(to: p(86, 76))
        path.addQuadCurve(to: p(79, 66), control: p(83, 64))
        path.addQuadCurve(to: p(65, 66), control: p(67, 68))
        
        path.move(to: p(86, 76))
        path.addLine(to: p(86, 78))
        path.addLine(to: p(81, 85))
        path.addQuadCurve(to: p(77, 83), control: p(78, 84))
        path.addQuadCurve(to: p(68, 95), control: p(70, 96))
        path.addQuadCurve(to: p(70, 82), control: p(73, 85))
        
        path.move(to: p(66, 83))
        path.addQuadCurve(to: p(71, 76), control: p(74, 80))
        path.addQuadCurve(to: p(79, 73), control: p(80, 77))
        path.addQuadCurve(to: p(81, 78), control: p(76, 78))
        path.addQuadCurve(to: p(77, 83), control: p(76, 76))
        
        
        path.move(to: p(68, 95))
        path.addQuadCurve(to: p(57, 102), control: p(58, 103))
        path.move(to: p(63, 99))
        
        path.addLine(to: p(65, 115))
        path.addQuadCurve(to: p(41, 115), control: p(43, 120))
        
        
 

        return path
    }
}

struct DShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
     
        path.move(to: p(41, 115))
        path.addLine(to: p(41, 98))
        path.addLine(to: p(48, 60))
        path.addQuadCurve(to: p(58, 11), control: p(58, 19))
        
        path.addQuadCurve(to: p(65, 13), control: p(62, 9))
        path.addQuadCurve(to: p(64, 50), control: p(65, 52))
        
        path.addLine(to: p(80, 45))
        path.addQuadCurve(to: p(92, 58), control: p(90, 52))
        path.addLine(to: p(91, 65))
        
        path.addQuadCurve(to: p(92, 73), control: p(100, 64))
        path.addLine(to: p(88, 74))
        
        path.addLine(to: p(86, 76))
        path.addLine(to: p(86, 78))
        path.addLine(to: p(81, 85))
        path.addQuadCurve(to: p(77, 83), control: p(78, 84))
        path.addQuadCurve(to: p(68, 95), control: p(70, 96))
        path.addQuadCurve(to: p(63, 99), control: p(64, 100))
        
        path.addLine(to: p(65, 115))
        path.addQuadCurve(to: p(41, 115), control: p(43, 120))

        return path
    }
}


#Preview("Outline") {
    ZStack {
//        Image("DShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .background(.black)
        DShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        DShape()
            .stroke(.black, lineWidth: 1)
            .frame(width: 200, height: 200)
            .padding()
    }
}

