//
//  ShapeFactory.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 19/06/26.
//

import Foundation

enum ShapeFactory {
    static func outline(for letter: String) -> AnyShape {
        switch letter.uppercased() {
        case "A": return AnyShape(AShape())
        case "B": return AnyShape(BShape())
        case "C": return AnyShape(CShape())
        case "D": return AnyShape(DShape())
        case "E": return AnyShape(EShape())
        case "F": return AnyShape(FShape())
        case "G": return AnyShape(GShape())
        case "H": return AnyShape(HShape())
        case "I": return AnyShape(IShape())
        case "J": return AnyShape(JShape())
        case "K": return AnyShape(KShape())
        case "L": return AnyShape(LShape())
        case "M": return AnyShape(MShape())
        case "N": return AnyShape(NShape())
        case "O": return AnyShape(OShape())
        case "P": return AnyShape(PShape())
        case "Q": return AnyShape(QShape())
        case "R": return AnyShape(RShape())
        case "S": return AnyShape(SShape())
        case "T": return AnyShape(TShape())
        case "U": return AnyShape(UShape())
        case "V": return AnyShape(VShape())
        case "W": return AnyShape(WShape())
        case "X": return AnyShape(XShape())
        case "Y": return AnyShape(YShape())
        case "Z": return AnyShape(ZShape())
        default:
            return AnyShape(BShape())
        }
    }
    
    static func filled(for letter: String) -> AnyShape {
        switch letter.uppercased() {
        case "A": return AnyShape(AShapeFill())
        case "B": return AnyShape(BShapeFill())
        case "C": return AnyShape(CShapeFill())
        case "D": return AnyShape(DShapeFill())
        case "E": return AnyShape(EShapeFill())
        case "F": return AnyShape(FShapeFill())
        case "G": return AnyShape(GShapeFill())
        case "H": return AnyShape(HShapeFill())
        case "I": return AnyShape(IShapeFill())
        case "J": return AnyShape(JShapeFill())
        case "K": return AnyShape(KShapeFill())
        case "L": return AnyShape(LShapeFill())
        case "M": return AnyShape(MShapeFill())
        case "N": return AnyShape(NShapeFill())
        case "O": return AnyShape(OShapeFill())
        case "P": return AnyShape(PShapeFill())
        case "Q": return AnyShape(QShapeFill())
        case "R": return AnyShape(RShapeFill())
        case "S": return AnyShape(SShapeFill())
        case "T": return AnyShape(TShapeFill())
        case "U": return AnyShape(UShapeFill())
        case "V": return AnyShape(VShapeFill())
        case "W": return AnyShape(WShapeFill())
        case "X": return AnyShape(XShapeFill())
        case "Y": return AnyShape(YShapeFill())
        case "Z": return AnyShape(ZShapeFill())
        default:
            return AnyShape(BShape())
        }
    
    }
}
