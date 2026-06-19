//
//  CardTutorialView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct HorizontalVocabularyView<FillShape: Shape, OutlineShape: Shape> : View {
    var fillShape: FillShape
    var outlineShape: OutlineShape
    var letter: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.lightPurple.opacity(0.1))
                .frame(height: 200)
                .glassEffect(in: .rect(cornerRadius: 16.0))
                .background(.whitePurple)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .shadow(radius: 8, y: 5)
            
            HStack {
                ZStack {
                    Circle()
                        .fill(.lightPurple.opacity(0.1))
                        .frame(width: 80)
                    HandFullHelper(fillShape: fillShape, outlineShape: outlineShape, width: 60, height: 60, lineWidth: 0.3)
                   
                }
                .padding(.leading, 32)
                
                VStack(alignment: .leading) {
                    Text(letter)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.lightPurple)
                    
                    Text("This  form the \(letter) Letter")
                }
                .padding(.leading, 16)
                .padding(.top, -8)
                
                Spacer()
                
            }
            .frame(maxHeight: 240)
        }
        
        
    }
}

#Preview {
    HorizontalVocabularyView(fillShape: LShapeFill(), outlineShape: LShape(), letter: "L")
}
