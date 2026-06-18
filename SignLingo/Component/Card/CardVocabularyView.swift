//
//  CardTutorialView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct CardVocabularyView<FillShape: Shape, OutlineShape: Shape> : View {
    var fillShape: FillShape
    var outlineShape: OutlineShape
    var letter: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.lightPurple.opacity(0.1))
                .frame(height: 240)
                .glassEffect(in: .rect(cornerRadius: 16.0))
                .background(.whitePurple)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .shadow(radius: 8, y: 5)
            
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(.lightPurple.opacity(0.1))
                        .frame(width: 120)
                    HandFullHelper(fillShape: fillShape, outlineShape: outlineShape, width: 100, height: 100, lineWidth: 0.3)
                   
                }
                .padding(.bottom, 16)
                
                Text(letter)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.lightPurple)
                
                Spacer()
                
            }
            .frame(maxHeight: 240)
        }
        
        
    }
}

#Preview {
    CardVocabularyView(fillShape: LShapeFill(), outlineShape: LShape(), letter: "L")
}
