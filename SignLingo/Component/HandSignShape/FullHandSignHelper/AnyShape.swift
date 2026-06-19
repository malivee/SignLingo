//
//  AnyShape.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 19/06/26.
//

import SwiftUI

struct AnyShape: Shape {
    private let pathBuilder: (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        self.pathBuilder = { rect in
            shape.path(in: rect)
        }
    }

    func path(in rect: CGRect) -> Path {
        pathBuilder(rect)
    }
}
