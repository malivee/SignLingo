//
//  CardTutorialView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 17/06/26.
//

import SwiftUI

struct CardTutorialView: View {
    
    var title: String
    var subtitle: String
    var icon: String
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.lightPurple.opacity(0.1))
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .glassEffect(in: .rect(cornerRadius: 16.0))
                .background(.whitePurple)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .shadow(radius: 8, y: 5)
            
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(.whitePurple)
                        .frame(width: 80)
                    Image(systemName: icon)
                        .tint(.whiteBackground)
                        .font(.largeTitle)
                    
                   
                }
                .padding(.bottom, 16)
                
                Text(title)
                    .font(.body.bold())
                Text(subtitle)
                    .font(.callout.weight(.thin))
                
                Spacer()
                
            }
            .frame(maxHeight: 240)
        }
        
        
    }
}

#Preview {
    CardTutorialView(title: "Place phone", subtitle: "Lean it against a sturdy object at the eye level", icon: "iphone")
}
