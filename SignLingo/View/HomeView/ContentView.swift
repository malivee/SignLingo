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
    @State private var isOpeningDictionary = false
    
    
    var body: some View {
        NavigationStack {
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
            .padding(.horizontal, 16)
            .background(ignoresSafeAreaEdges: .all)
            
            
            
            Divider()
                .overlay(.lightPurple)
            
            
            
            ScrollView {
                
                VStack {
                    
                    CardView(isStartDetection: $isStartingDetection)
                        .padding(.horizontal, -16)
                        .navigationDestination(isPresented: $isStartingDetection, destination: {
                            CameraView()
                                .ignoresSafeArea()
                        })
                    
                    VStack(alignment: .leading) {
                        Text("Tutorial")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.lightPurple)
                        CardTutorialView(title: "Place phone", subtitle: "Lean it against a sturdy object at the eye level", icon: "iphone")
                        CardTutorialView(title: "Start signing", subtitle: "Keep your hands within the camera's frame.", icon: "hand.raised")
                        CardTutorialView(title: "View sentence", subtitle: "Watch your signs turn into text instantly!", icon: "text.bubble")
                        
                    }
                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text("Sign Dictionary")
                                .font(.title2.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.lightPurple)
                            
                            Button("Open Chevron", systemImage: "chevron.right") {
                                isOpeningDictionary = !isOpeningDictionary
                            }
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.lightPurple)
                            Spacer()
                        }
                        
                        LazyVGrid(columns: columns) {
                            CardVocabularyView(fillShape: AShapeFill(), outlineShape: AShape(), letter: "A")
                            CardVocabularyView(fillShape: BShapeFill(), outlineShape: BShape(), letter: "B")
                            
                        }
                    }
                    
                    
                    
                    Spacer()
                    
                }
                .sheet(isPresented: $isOpeningDictionary, content: {
                    DictionaryView()
                })
                
                .padding()
            }
            
            .scrollIndicators(.hidden)
            .background {
                Color.whiteBackground
                    .ignoresSafeArea()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
