//
//  YShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct YShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(56, 117))
        path.addLine(to: p(52, 90))
        
        path.addQuadCurve(to: p(37, 73), control: p(37, 73))
        path.addQuadCurve(to: p(24, 58), control: p(20, 55))
        
        path.addQuadCurve(to: p(32, 52), control: p(20, 48))
        path.addLine(to: p(45, 60))
        path.addLine(to: p(43, 47))
//        path.addLine(to: p(35, 55))
//        path.addQuadCurve(to: p(43, 47), control: p(41, 45))
        
//        path.addLine(to: p(59, 47))
//
//        path.addQuadCurve(to: p(56, 59), control: p(66, 54))
//        path.addLine(to: p(47, 59))
//        path.move(to: p(50, 59))
//        path.addQuadCurve(to: p(50, 67), control: p(52, 63))
        
        path.move(to: p(43, 47))
        path.addLine(to: p(48, 34))
        path.addQuadCurve(to: p(58, 37), control: p(54, 30))
        
        path.move(to: p(57, 59))
        
        path.addQuadCurve(to: p(48, 49), control: p(48, 59))
        
        path.move(to: p(58, 37))
        

        
        
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
//        path.addLine(to: p(86, 55))
//        
//        path.addQuadCurve(to: p(77, 55), control: p(80, 66))
//        
//        path.move(to: p(86, 55))
//
//        
//        path.addQuadCurve(to: p(84, 90), control: p(87, 83))
        path.addLine(to: p(82, 13))
        
        path.addQuadCurve(to: p(89, 15), control: p(85, 8))
        path.addLine(to: p(86, 55))
        
        path.addLine(to: p(88, 117))
        
        path.addQuadCurve(to: p(56, 117), control: p(56, 127))
        
        
        
 

        return path
    }
}

struct YShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(56, 117))
        path.addLine(to: p(52, 90))
        
        path.addQuadCurve(to: p(37, 73), control: p(37, 73))
        path.addQuadCurve(to: p(24, 58), control: p(20, 55))
        
        path.addQuadCurve(to: p(32, 52), control: p(20, 48))
        path.addLine(to: p(45, 60))
        path.addLine(to: p(43, 47))
        
//        path.addLine(to: p(43, 4))
//        path.addQuadCurve(to: p(53, 0), control: p(47, -10))
        path.addLine(to: p(48, 34))
        path.addQuadCurve(to: p(58, 37), control: p(54, 30))
//        path.addLine(to: p(53, 37))
        path.addQuadCurve(to: p(58, 37), control: p(54, 40))
//        
//        path.addQuadCurve(to: p(37, 73), control: p(37, 76))
//        path.addLine(to: p(35, 55))
//        path.addQuadCurve(to: p(43, 47), control: p(41, 45))
//        path.addLine(to: p(48, 34))
//        path.addQuadCurve(to: p(58, 37), control: p(54, 30))
        
        path.addQuadCurve(to: p(68, 37), control: p(64, 30))
        path.addQuadCurve(to: p(77, 40), control: p(75, 34))
        
//        path.addQuadCurve(to: p(86, 40), control: p(80, 35))
//        path.addLine(to: p(86, 55))
//        
//        path.addQuadCurve(to: p(84, 90), control: p(87, 83))
        path.addLine(to: p(82, 13))
        
        path.addQuadCurve(to: p(89, 15), control: p(85, 8))
        path.addLine(to: p(86, 55))
        
        path.addLine(to: p(88, 117))
        
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
////            .scaleEffect(x: -1)
//            .background(.black)
        YShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .scaleEffect(x: -1)
            .padding()
        YShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .scaleEffect(x: -1)
            .padding()
    }
}
