//
//  CardTutorialView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct CardTutorialView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.lightPurple.opacity(0.1))
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .background(.ultraThickMaterial)
                .background(.lightPurple.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .glassEffect(.identity)
            
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(.whitePurple)
                        .frame(width: 80)
                    HandFullHelper(fillShape: AShapeFill(), outlineShape: AShape(), lineWidth: 0.3)
                   
                }
                .padding(.bottom, 16)
                
                Text("Place phone")
                    .font(.body.bold())
                Text("Lean it against a sturdy object at eye level.")
                    .font(.callout.weight(.thin))
                
                Spacer()
                
            }
            .frame(maxHeight: 240)
        }
        
        
    }
}

#Preview {
    CardTutorialView()
}
