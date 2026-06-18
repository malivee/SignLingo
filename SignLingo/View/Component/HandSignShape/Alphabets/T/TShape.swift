//
//  TShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct TShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(52, 105))
        path.addLine(to: p(48, 96))
        path.addLine(to: p(45, 50))
        
        path.addQuadCurve(to: p(58, 27), control: p(60, 35))
        path.addLine(to: p(74, 21))
        path.addQuadCurve(to: p(86, 31), control: p(85, 28))
        path.addQuadCurve(to: p(78, 35), control: p(84, 40))
        
        path.addQuadCurve(to: p(73, 32), control: p(75, 35))
        path.addQuadCurve(to: p(65, 36), control: p(68, 36))
        path.addQuadCurve(to: p(65, 46), control: p(65, 46))
        
        path.move(to: p(78, 35))
        
        path.addLine(to: p(78, 45))
        
        path.addLine(to: p(57, 46))
        
        path.move(to: p(78, 45))
        
        path.addQuadCurve(to: p(82, 57), control: p(88, 47))
        path.addLine(to: p(62, 56))
        
        path.move(to: p(82, 57))
        
        path.addQuadCurve(to: p(82, 69), control: p(88, 59))
        path.addQuadCurve(to: p(64, 67), control: p(67, 63))
        
        path.move(to: p(82, 69))
        
        path.addQuadCurve(to: p(73, 83), control: p(78, 85))
        path.addLine(to: p(74,78))
        
        path.addLine(to: p(68, 79))
        
        path.move(to: p(74, 78))
        path.addLine(to: p(76, 78))
        
        path.move(to: p(73, 83))
        
        path.addLine(to: p(72, 100))
        
        path.addLine(to: p(74, 105))
        
        path.addQuadCurve(to: p(52, 105), control: p(55, 110))

        
 

        return path
    }
}

struct TShapeFill: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()
        path.move(to: p(52, 105))
        path.addLine(to: p(48, 96))
        path.addLine(to: p(45, 50))
        
        path.addQuadCurve(to: p(58, 27), control: p(60, 35))
        path.addLine(to: p(74, 21))
        path.addQuadCurve(to: p(86, 31), control: p(85, 28))
        path.addQuadCurve(to: p(78, 35), control: p(84, 40))
        
        path.addLine(to: p(78, 45))
        
        path.addQuadCurve(to: p(82, 57), control: p(88, 47))
        
        path.addQuadCurve(to: p(82, 69), control: p(88, 59))
        
        path.addQuadCurve(to: p(73, 83), control: p(78, 85))
        
        path.addLine(to: p(72, 100))
        
        path.addLine(to: p(74, 105))
        
        path.addQuadCurve(to: p(52, 105), control: p(55, 110))
        
       

        return path
    }
}

#Preview("Outline") {
    ZStack {
        Image("TShape")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(.black)
        TShapeFill()
            .fill(.skin)
            .frame(width: 200, height: 200)
            .padding()
        TShape()
            .stroke(.black, lineWidth: 3)
            .frame(width: 200, height: 200)
            .padding()
    }
}
