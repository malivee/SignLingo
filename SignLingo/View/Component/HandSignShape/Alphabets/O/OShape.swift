//
//  OShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 16/06/26.
//

import SwiftUI

struct OShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        
        path.move(to: p(62, 48))
        path.addLine(to: p(58, 50))
        path.move(to: p(60, 50))
        path.addQuadCurve(to: p(50, 59), control: p(53, 61))
        path.move(to: p(57, 58))
        path.addQuadCurve(to: p(48, 71), control: p(51, 72))
        path.move(to: p(65, 64))
        path.addQuadCurve(to: p(57, 75), control: p(57, 71))

        path.move(to: p(83, 53))
        path.addQuadCurve(to: p(77, 52), control: p(77, 54))
        
        path.move(to: p(57, 110))
        path.addQuadCurve(to: p(55, 90), control: p(51, 89))
        path.addQuadCurve(to: p(43, 92), control: p(45, 94))
        path.move(to: p(55, 90))
        
        path.addQuadCurve(to: p(67, 83), control: p(67, 85))
//        path.addQuadCurve(to: p(83, 73), control: p(83, 72))
//        path.addLine(to: p(96, 69))
//        path.addQuadCurve(to: p(93, 60), control: p(102, 62))
//        path.addQuadCurve(to: p(77, 63), control: p(80, 60))
        path.addQuadCurve(to: p(83, 60), control: p(86, 63))
        path.addQuadCurve(to: p(87, 44), control: p(89, 42))
        path.addQuadCurve(to: p(80, 40), control: p(88, 35))
        path.addLine(to: p(70, 60))
        
        path.addQuadCurve(to: p(62, 48), control: p(58, 62))
        
        path.addQuadCurve(to: p(68, 42), control: p(70, 43))
        
        path.addQuadCurve(to: p(76, 39), control: p(78, 40))
        path.addQuadCurve(to: p(85, 39), control: p(87, 41))
        
        path.addQuadCurve(to: p(85, 33), control: p(92, 36))
        path.addLine(to: p(78, 30))
        path.addLine(to: p(62, 34))
        path.addLine(to: p(50, 45))
        
        path.move(to: p(78, 30))
        
        path.addLine(to: p(90, 31))
        path.addQuadCurve(to: p(93, 23), control: p(96, 26))
        path.addLine(to: p(78, 21))
        path.addLine(to: p(61, 26))
        path.addLine(to: p(49, 37))
        
        path.move(to: p(85, 22))
        path.addLine(to: p(85, 22))
        path.addQuadCurve(to: p(90, 13), control: p(94, 20))
        
        path.addQuadCurve(to: p(75, 15), control: p(74, 14))
        path.addQuadCurve(to: p(59, 20), control: p(60, 17))
        path.addLine(to: p(40, 40))
        path.addLine(to: p(30, 94))
        path.addLine(to: p(33, 112))
        path.addQuadCurve(to: p(57, 110), control: p(59, 114))
        
        
        
 

        return path
    }
}

struct OShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
     
        path.move(to: p(57, 110))
        path.addQuadCurve(to: p(55, 90), control: p(51, 89))
        
        path.addQuadCurve(to: p(67, 83), control: p(67, 85))
        path.addQuadCurve(to: p(83, 60), control: p(86, 63))
        path.addQuadCurve(to: p(87, 44), control: p(89, 42))
        path.addQuadCurve(to: p(80, 40), control: p(88, 35))
        path.addLine(to: p(70, 60))
        
        path.addQuadCurve(to: p(62, 48), control: p(58, 62))
        
        path.addQuadCurve(to: p(68, 42), control: p(70, 43))
        
        path.addQuadCurve(to: p(76, 39), control: p(78, 40))
        path.addQuadCurve(to: p(85, 39), control: p(87, 41))
        
        path.addQuadCurve(to: p(85, 33), control: p(92, 36))
        path.addLine(to: p(78, 30))
        
        path.addLine(to: p(90, 31))
        path.addQuadCurve(to: p(93, 23), control: p(96, 26))
        
        path.addLine(to: p(85, 22))
        path.addQuadCurve(to: p(90, 13), control: p(94, 20))
        
        path.addQuadCurve(to: p(75, 15), control: p(74, 14))
        path.addQuadCurve(to: p(59, 20), control: p(60, 17))
        path.addLine(to: p(40, 40))
        path.addLine(to: p(30, 94))
        path.addLine(to: p(33, 112))
        path.addQuadCurve(to: p(57, 110), control: p(59, 114))

        return path
    }
}

#Preview("Outline") {
    ZStack {
//        Image("OShape")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .background(.black)
        OShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        OShape()
            .stroke(.red, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}

