//
//  HandFullHelper.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct HandFullHelper<FillShape: Shape, OutlineShape: Shape>: View {
    var fillShape: FillShape
    var outlineShape: OutlineShape
    var width: CGFloat = 50
    var height: CGFloat = 50
    var lineWidth: CGFloat = 2
    
    var body: some View {
        ZStack {
            fillShape
                .fill(.skin)
                .frame(width: width, height: height)
            outlineShape
                .stroke(.black, lineWidth: lineWidth)
                .frame(width: width, height: height)
        }
       
        
            
    }

}

#Preview {
    HandFullHelper(fillShape: AShapeFill(), outlineShape: AShape())
}
