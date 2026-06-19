//
//  DictionaryView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 18/06/26.
//

import SwiftUI

struct DictionaryView: View {
    
    private let letters: Array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                
                LazyVGrid(columns: columns, content: {
                    ForEach(letters, id: \.self) { letter in
                        CardVocabularyView(fillShape: ShapeFactory.filled(for: letter), outlineShape: ShapeFactory.outline(for: letter), letter: letter)
                        
                    }
                    
    
                })
            }
            .navigationTitle("Sign Alphabet")
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    DictionaryView()
}
