//
//  CameraFullView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 19/06/26.
//

import SwiftUI
import Vision

struct CameraFullView: View {
    @State private var prediction: String = "?"
    @State private var confidence: Double = 0.0
    @State private var currentString: [String] = []
    @State private var isPanelHidden = false
    @State private var isShowingDictionary: Bool = false
    @State private var handPoints: [VNHumanHandPoseObservation.JointName: CGPoint] = [:]
    var body: some View {
        NavigationStack {
            ZStack {
                CameraView(
                    prediction: $prediction,
                    confidence: $confidence,
                    handPoints: $handPoints
                )
                .ignoresSafeArea()
                HandPoseOverlayView(points: handPoints)
                    .ignoresSafeArea()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Vocabulary", systemImage: "info.circle") {
                                isShowingDictionary = !isShowingDictionary
                            }
                        
                            
                        }
                    }
                    .sheet(isPresented: $isShowingDictionary, content: {
                        DictionaryView()
                    })
                
                VStack {
                    HStack {
                        TopSignCard(letter: prediction == "?" || prediction == "—" ? "A" : prediction)
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                    if !isPanelHidden {
                        BottomPanel(
                            prediction: prediction,
                            confidence: confidence,
                            currentString: $currentString
                        )
                        
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if value.translation.width > 30 {
                                        withAnimation(.spring()) {
                                            isPanelHidden = true
                                        }
                                    }
                                }
                        )
                    } else {
                        HStack {
                            Spacer()
                            Button {
                                withAnimation(.spring()) {
                                    isPanelHidden = false
                                }
                            } label: {
                                Label("Show Panel", systemImage: "chevron.left")
                                    .labelStyle(.iconOnly)
                                    .foregroundStyle(.lightPurple)
                                    .frame(width: 35)
                                    .frame(height: 150)
                                    .background(.whiteBackground)
                            }
                            .gesture(
                                DragGesture()
                                    .onEnded { value in
                                        if value.translation.width < -30 {
                                            withAnimation {
                                                isPanelHidden = false
                                            }
                                        }
                                    }
                            )
                            .transition(.move(edge: .trailing))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.bottom, 32)
                            .offset(y: -50)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                }
                .animation(.spring(), value: isPanelHidden)
            }
        }
    }
}

struct TopSignCard: View {
    let letter: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("SIGN")
                .font(.body.bold())
                .foregroundStyle(.lightPurple)
            
            HandFullHelper(
                fillShape: ShapeFactory.filled(for: letter),
                outlineShape: ShapeFactory.outline(for: letter),
                width: 55,
                height: 55,
                lineWidth: 0.3
            )
            
            Text(letter)
                .font(.title3.bold())
                .foregroundStyle(.lightPurple)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background(.whiteBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.lightPurple, lineWidth: 2)
        }
        .padding(.trailing, 240)
        .padding(.bottom, 150)
        .offset(y: 80)
    }
}

struct BottomPanel: View {
    let prediction: String
    let confidence: Double
    @Binding var currentString: [String]
    
    @State private var isGoToNextPage: Bool = false
    
    var confidenceText: String {
        "\(Int(confidence * 100))% Confidence"
    }
    
    var confidenceLevel: String {
        switch confidence {
        case ..<0.5:
            return "Low"
        case 0.5..<0.75:
            return "Medium"
        default:
            return "High"
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ConfidenceCard(
                prediction: prediction,
                confidence: confidence,
                confidenceText: confidenceText,
                confidenceLevel: confidenceLevel
            )
            
            Text("Current String")
                .font(.headline.bold())
                .foregroundStyle(.lightPurple)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 8) {
                        
                        ForEach(currentString.enumerated(), id: \.offset) {_,  letter in
                            HandBox(letter: letter)
                            
                        }
                    }
                    .frame(height: 50)
                }
                DeleteBox(currentString: $currentString)
            }
            
            Button {
                isGoToNextPage = !isGoToNextPage
            } label: {
                Label("View Full Word", systemImage: "doc.text")
                    .foregroundStyle(currentString.isEmpty ? .gray : .darkBrown)
                    .font(.body)
                    .frame(height: 42)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 50)
            .tint(.lightOrange)
            .disabled(currentString.isEmpty)
            
            Button {
                if prediction != "-" || !prediction.isEmpty || prediction != "?" {
                    currentString.append(prediction)
                }
            } label: {
                Label("Submit & Next Letter", systemImage: "arrow.right")
                    .font(.callout)
                    .foregroundStyle(prediction == "-" || prediction == "?" || prediction.isEmpty ?  .gray : .whiteBackground)
                    .frame(maxWidth: .infinity)
                    .frame(height: 46)
            }
            .buttonStyle(.borderedProminent)
            .tint(.lightPurple)
            .disabled(prediction == "-" || prediction == "?" || prediction.isEmpty)
        }
        .navigationDestination(isPresented: $isGoToNextPage, destination: {
            ResultView(predictions: currentString)
        })
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(.whitePurple)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 28,
                topTrailingRadius: 28
            )
        )
    }
}

struct ConfidenceCard: View {
    let prediction: String
    let confidence: Double
    let confidenceText: String
    let confidenceLevel: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 6) {
                Text("DETECTED SIGN")
                    .font(.body).bold()
                    .foregroundStyle(.lightPurple)
                
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.lightPurple)
                    .font(.body)
                
                Text("Confidence")
                    .font(.callout)
                    .foregroundStyle(.lightPurple)
            }
            
            HStack(spacing: 16) {
                Text(prediction)
                    .font(.body.bold())
                    .foregroundStyle(.whiteBackground)
                    .frame(width: 65, height: 65)
                    .background(.lightPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack(spacing: 8) {
                    HStack {
                        Text(confidenceText)
                            .font(.body)
                            .foregroundStyle(.primary)
                        
                        Spacer()
                        
                        Text(confidenceLevel)
                            .font(.body)
                            .foregroundStyle(.lightPurple)
                    }
                    
                    ProgressView(value: confidence)
                        .tint(.lightPurple)
                }
            }
        }
        .padding(16)
        .background(.whiteBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.lightPurple, lineWidth: 2)
        }
    }
}

struct HandBox: View {
    let letter: String
    
    var body: some View {
        HandFullHelper(
            fillShape: ShapeFactory.filled(for: letter),
            outlineShape: ShapeFactory.outline(for: letter),
            width: 40,
            height: 40,
            lineWidth: 0.3
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightPurple.opacity(0.14))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

struct DeleteBox: View {
    @Binding var currentString: [String]
    var body: some View {
        Button {
            if !currentString.isEmpty {
                currentString.removeLast()
            }
        }label: {
            Label("Delete String", systemImage: "delete.left")
                .labelStyle(.iconOnly)
                .font(.system(size: 24))
                .disabled(currentString.isEmpty || currentString.count == 0)
                .foregroundStyle(.lightPurple)
                .frame(width: 70, height: 50)
                .background(.lightPurple.opacity(0.14))
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    CameraFullView()
        .ignoresSafeArea()
}
