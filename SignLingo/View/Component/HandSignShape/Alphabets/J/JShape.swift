//
//  JShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 16/06/26.
//

import SwiftUI

struct JShape: Shape {
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
        path.addLine(to: p(82, 13))
        
        path.addQuadCurve(to: p(89, 15), control: p(85, 8))
        path.addLine(to: p(86, 55))
        
        path.addQuadCurve(to: p(84, 90), control: p(87, 83))
        
        path.addLine(to: p(88, 117))
        
        path.addQuadCurve(to: p(56, 117), control: p(56, 127))
        
        
        
 

        return path
    }
}

struct JShapeFill: Shape {
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
        path.addLine(to: p(82, 13))
        
        path.addQuadCurve(to: p(89, 15), control: p(85, 8))
        path.addLine(to: p(86, 55))
        
        path.addQuadCurve(to: p(84, 90), control: p(87, 83))
        
        path.addLine(to: p(88, 117))
        
        path.addQuadCurve(to: p(56, 117), control: p(56, 127))


        return path
    }
}

#Preview("Outline") {
    ZStack {
        Image("JShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(.black)
        JShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        JShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
