//
//  ContentView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 15/06/26.
//

import SwiftUI

struct ContentView: View {

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var isStartingDetection = false

    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack(alignment: .center) {
                        HandFullHelper(fillShape: HShapeFill(), outlineShape: HShape(), width: 30, height: 30, lineWidth: 0.3)
                            .padding(.trailing, -16)
                        
                        
                        HandFullHelper(fillShape: EShapeFill(), outlineShape: EShape(),  width: 30, height: 30, lineWidth: 0.3)
                            .padding(.trailing, -16)
                        
                        HandFullHelper(fillShape: LShapeFill(), outlineShape: LShape(),  width: 30, height: 30, lineWidth: 0.3)
                            .padding(.trailing, -16)
                        
                        HandFullHelper(fillShape: LShapeFill(), outlineShape: LShape(),  width: 30, height: 30, lineWidth: 0.3)
                            .padding(.trailing, -16)
                        HandFullHelper(fillShape: OShapeFill(), outlineShape: OShape(),  width: 30, height: 30, lineWidth: 0.3)
                            .padding(.trailing, -8)
                        
                        Text("Hello")
                            .font(.title.bold())
                            .foregroundStyle(.lightPurple)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.bottom, -4)
                    Divider()
                        .background(.lightPurple)
                    
                    
                    CardView(isStartDetection: $isStartingDetection)
                        .padding(.horizontal, -16)
                        .navigationDestination(isPresented: $isStartingDetection, destination: {
                            CameraView()
                        })
                    
                    VStack(alignment: .leading) {
                        Text("Tutorial")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.lightPurple)
                        CardTutorialView()
                        CardTutorialView()
                        CardTutorialView()
                    }
                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text("Sign Dictionary")
                                .font(.title2.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.lightPurple)
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10)
                                .foregroundStyle(.lightPurple)
                            Spacer()
                        }
                        
                        LazyVGrid(columns: columns) {
                            CardVocabularyView()
                            CardVocabularyView()
                            CardVocabularyView()
                            CardVocabularyView()
                            CardVocabularyView()
                            CardVocabularyView()
                            CardVocabularyView()
                            CardVocabularyView()
                        }
                    }
                    
                   
                    
                    Spacer()
                    
                }
                
                .padding()
            }
            .scrollIndicators(.hidden)
            
        }
        .background {
            Color.whiteBackground
        }
    }
}

#Preview {
    ContentView()
}
