//
//  HandWaveShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct HandWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width / 127
        let h = rect.height / 127

        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            CGPoint(x: x * w, y: y * h)
        }

        var path = Path()

        path.move(to: p(75, 45))
        path.addQuadCurve(to: p(65, 60), control: p(65, 39))
        path.addLine(to: p(38, 45))
        path.addQuadCurve(to: p(34, 53), control: p(33, 46))
        path.addLine(to: p(56, 63))
        path.addLine(to: p(53, 70))
        path.addLine(to: p(24, 61))
        path.addQuadCurve(to: p(22, 70), control: p(18, 64))
        path.addLine(to: p(51, 78))
        path.addLine(to: p(49, 84))
        path.addLine(to: p(23, 79))
        path.addQuadCurve(to: p(23, 87), control: p(18, 83))
        path.addLine(to: p(48, 91))
        path.addLine(to: p(45, 99))
        path.addLine(to: p(25, 98))
        path.addQuadCurve(to: p(26, 106), control: p(22, 102))
        path.addLine(to: p(71, 108))
        path.addQuadCurve(to: p(78, 102), control: p(80, 102))
        path.addLine(to: p(87, 75))
        path.addQuadCurve(to: p(87, 72), control: p(87, 75))
        path.addLine(to: p(75, 45))
        
        
        path.move(to: p(93, 70))
        path.addLine(to: p(81, 44))
        path.addLine(to: p(85, 43))
        path.addLine(to: p(75, 20))
        path.addQuadCurve(to: p(84, 17), control: p(76, 12))
        path.addLine(to: p(95, 46))
        path.addQuadCurve(to: p(108, 38), control: p(98, 37))
        path.addQuadCurve(to: p(100, 72), control: p(104, 72))
        path.addLine(to: p(92, 77))
        path.closeSubpath()
        
        path.move(to: p(73, 37))
        path.addLine(to: p(62, 21))
        path.addQuadCurve(to: p(55, 24), control: p(55, 18))
        path.addLine(to: p(65, 39))
        path.addQuadCurve(to: p(73, 37), control: p(70, 35))
        
        path.move(to: p(59, 45))
        path.addLine(to: p(49, 33))
        path.addQuadCurve(to: p(48, 44), control: p(38, 38))
        path.addLine(to: p(59, 48))
        path.closeSubpath()

        return path
    }
}

#Preview("Outline") {
    ZStack {
        Image("HandWave")
            .background(.black)
        HandWaveShape()
            .stroke(.red, lineWidth: 2)
            .frame(width: 200, height: 200)
            .padding()
    }
}
