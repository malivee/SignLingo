//
//  CardView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct CardView: View {
    
    @Binding var isStartDetection: Bool
    
    var body: some View {
            
            ZStack {
                cardView(backgroundColor: .darkPurple)
                    .offset(x: 2, y: 8)
                cardView(backgroundColor: .cardPurple, isBackground: true)
            }
     
    }
    
    private func cardView(backgroundColor: Color, isBackground: Bool = false) -> some View {
        VStack(alignment: .leading) {
            ZStack {
                

                
                HandWaveShape()
                    .fill(.whitePurple.opacity(0.7))
                    .frame(width: 200, height: 200)
                    .offset(x: 140, y: -50)
                    .opacity(isBackground ? 0.3 : 0)
    
                
                VStack(alignment: .leading) {
            
                    Text("Ready to Learn?")
                        .foregroundStyle(.white)
                        .font(.title2.bold())
                        .padding(.bottom, 4)
                        .padding(.top, 32)
                    
                    
                    Text("Start real-time detection and learn sign language!")
                        .foregroundStyle(.white)
                        .font(.body.weight(.light))
                    
                        .padding(.bottom, 16)
                    
                    Button {
                        isStartDetection = !isStartDetection
                    } label : {
                        HStack {
                            ZStack {
                                
                                Text("Start Detection")
                                    .opacity(isBackground ? 0 : 1)
                                    .padding(16)
                                    .foregroundStyle(.darkBrown)
                                    .font(.title3.bold())
                                    .background(.darkBrown)
                                    .clipShape(RoundedRectangle(cornerRadius: 24))
                                    .offset(x: 2, y: 8)
                                
                                Text("Start Detection")
                                    .padding(16)
                                    .foregroundStyle(.darkBrown)
                                    .font(.title3.bold())
                                    .background(.lightOrange)
                                    .clipShape(RoundedRectangle(cornerRadius: 24))
                            }
                            
                        }
                    }
                    .foregroundStyle(.brown)
                    .padding(.bottom, 28)
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .padding(16)
    }
}


#Preview {
    CardView(isStartDetection: .constant(false))
}
