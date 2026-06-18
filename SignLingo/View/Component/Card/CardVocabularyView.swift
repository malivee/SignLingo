//
//  CardTutorialView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct CardVocabularyView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.lightPurple.opacity(0.068))
                .frame(height: 240)
                .background(.ultraThinMaterial)
                .background(.whitePurple.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(.lightPurple.opacity(0.05))
                        .frame(width: 120)
                    HandFullHelper(fillShape: LShapeFill(), outlineShape: LShape(), width: 100, height: 100, lineWidth: 0.3)
                   
                }
                .padding(.bottom, 16)
                
                Text("L")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.lightPurple)
                
                Spacer()
                
            }
            .frame(maxHeight: 240)
        }
        
        
    }
}

#Preview {
    CardVocabularyView()
}
