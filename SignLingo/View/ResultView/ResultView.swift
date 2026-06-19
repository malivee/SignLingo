//
//  ResultView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 18/06/26.
//

import SwiftUI

struct ResultView: View {
    let predictions: [String]
    
    @State private var isBackToCameraView: Bool = false
    @State private var isBackHome: Bool = false
    
    var body: some View {
        NavigationStack {
            
            HStack(alignment: .center) {
                HandFullHelper(fillShape: RShapeFill(), outlineShape: RShape(), width: 30, height: 30, lineWidth: 0.3)
                    .padding(.trailing, -16)
                
                HandFullHelper(fillShape: EShapeFill(), outlineShape: EShape(),  width: 30, height: 30, lineWidth: 0.3)
                    .padding(.trailing, -16)
                
                HandFullHelper(fillShape: SShapeFill(), outlineShape: SShape(),  width: 30, height: 30, lineWidth: 0.3)
                    .padding(.trailing, -16)
                
                HandFullHelper(fillShape: UShapeFill(), outlineShape: UShape(),  width: 30, height: 30, lineWidth: 0.3)
                    .padding(.trailing, -16)
                HandFullHelper(fillShape: LShapeFill(), outlineShape: LShape(),  width: 30, height: 30, lineWidth: 0.3)
                    .padding(.trailing, -16)
                
                HandFullHelper(fillShape: TShapeFill(), outlineShape: TShape(),  width: 30, height: 30, lineWidth: 0.3)
                    .padding(.trailing, -8)
                
                
                Text("Result")
                    .font(.title.bold())
                    .foregroundStyle(.lightPurple)
                
                Spacer()
                
            }
            .padding(.bottom, -4)
            .padding(.horizontal, 16)
            
            Divider()
                .background(.lightPurple)
            
            ScrollView {
                ZStack {
                    starBall(true)
                    starBall(false)
                }
                
                VStack {
                    Text("You form a word")
                        .font(.title.bold())
                        .foregroundStyle(.lightPurple)
                    
                    Text("Your sign language skills are growing stronger.")
                        .fontWeight(.light)
                    
                    Text("You translated:")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                        .padding(.horizontal, 16)
                    
                    Text(predictions.joined())
                        .font(.largeTitle)
                        .foregroundStyle(.lightPurple)
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 124)
                        .glassEffect(in: .rect(cornerRadius: 16.0))
                        .background(.whitePurple)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .shadow(radius: 8, y: 5)
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                    
                    Text("Detailed Breakdown:")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                        .padding(.horizontal, 16)
                    
                    //                    Group {
                    //                        HorizontalVocabularyView(fillShape: HShapeFill(), outlineShape: HShape(), letter: "H")
                    //                        HorizontalVocabularyView(fillShape: EShapeFill(), outlineShape: EShape(), letter: "E")
                    //                        HorizontalVocabularyView(fillShape: LShapeFill(), outlineShape: LShape(), letter: "L")
                    //                        HorizontalVocabularyView(fillShape: LShapeFill(), outlineShape: LShape(), letter: "L")
                    //                    }
                    //                    .padding(.horizontal, 16)
                    //                    .padding(.vertical, 4)
                    //
                    VStack {
                        ForEach(predictions.enumerated(), id: \.offset) {
                            _, prediction in
                            HorizontalVocabularyView(fillShape: ShapeFactory.filled(for: prediction), outlineShape: ShapeFactory.outline(for: prediction), letter: prediction)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    
                    
                    Button {
                        isBackToCameraView = true
                    } label: {
                        HStack {
                            Image(systemName: "arrow.trianglehead.clockwise")
                            Text("Play Again?")
                        }
                        .font(.title3.bold())
                        .foregroundStyle(.whiteBackground)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.lightPurple)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                    }
                    
                    
                    Button("Back to Home") {
                        isBackHome = true
                    }
                    .font(.title3.bold())
                    .foregroundStyle(.lightPurple)
                    .padding(16)
                    
                    
                }
                
                
                
            }
            .scrollIndicators(.hidden)
            .background {
                Color.whiteBackground
                    .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $isBackToCameraView, destination: {
            CameraFullView()
                .ignoresSafeArea()
        })
        .navigationDestination(isPresented: $isBackHome, destination: {
            ContentView()
        })
    }
    
    private func starBall(_ isBackground: Bool) -> some View {
        ZStack {
            Circle()
                .fill(isBackground ? .lightOrange : .lightOrange)
                .frame(width: isBackground ? 100 : 150)
                .frame(maxWidth: .infinity)
            StarballShape()
                .fill(.darkBrown)
                .frame(width: 50)
        }
        .blur(radius: isBackground ? 35 : 0)
        .padding(.top, 32)
        
    }
    
}

#Preview {
    ResultView(predictions: ["A", "B", "C"])
}
