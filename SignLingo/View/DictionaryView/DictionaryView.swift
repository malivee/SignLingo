//
//  DictionaryView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 18/06/26.
//

import SwiftUI

struct DictionaryView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    CardVocabularyView(fillShape: AShapeFill(), outlineShape: AShape(), letter: "A")
                    CardVocabularyView(fillShape: BShapeFill(), outlineShape: BShape(), letter: "B")
                    CardVocabularyView(fillShape: CShapeFill(), outlineShape: CShape(), letter: "C")
                    CardVocabularyView(fillShape: DShapeFill(), outlineShape: DShape(), letter: "D")
                    CardVocabularyView(fillShape: EShapeFill(), outlineShape: EShape(), letter: "E")
                    CardVocabularyView(fillShape: FShapeFill(), outlineShape: FShape(), letter: "F")
                    CardVocabularyView(fillShape: GShapeFill(), outlineShape: GShape(), letter: "G")
                    CardVocabularyView(fillShape: HShapeFill(), outlineShape: HShape(), letter: "H")
                    CardVocabularyView(fillShape: IShapeFill(), outlineShape: IShape(), letter: "I")
                    CardVocabularyView(fillShape: JShapeFill(), outlineShape: JShape(), letter: "J")
                    CardVocabularyView(fillShape: KShapeFill(), outlineShape: KShape(), letter: "K")
                    CardVocabularyView(fillShape: LShapeFill(), outlineShape: LShape(), letter: "L")
                    CardVocabularyView(fillShape: MShapeFill(), outlineShape: MShape(), letter: "M")
                    CardVocabularyView(fillShape: NShapeFill(), outlineShape: NShape(), letter: "N")
                    CardVocabularyView(fillShape: OShapeFill(), outlineShape: OShape(), letter: "O")
                    CardVocabularyView(fillShape: PShapeFill(), outlineShape: PShape(), letter: "P")
                    CardVocabularyView(fillShape: QShapeFill(), outlineShape: QShape(), letter: "Q")
                    CardVocabularyView(fillShape: RShapeFill(), outlineShape: RShape(), letter: "R")
                    CardVocabularyView(fillShape: SShapeFill(), outlineShape: SShape(), letter: "S")
                    CardVocabularyView(fillShape: TShapeFill(), outlineShape: TShape(), letter: "T")
                    CardVocabularyView(fillShape: UShapeFill(), outlineShape: UShape(), letter: "U")
                    CardVocabularyView(fillShape: VShapeFill(), outlineShape: VShape(), letter: "V")
                    CardVocabularyView(fillShape: WShapeFill(), outlineShape: WShape(), letter: "W")
                    CardVocabularyView(fillShape: XShapeFill(), outlineShape: XShape(), letter: "X")
                    CardVocabularyView(fillShape: YShapeFill(), outlineShape: YShape(), letter: "Y")
                    CardVocabularyView(fillShape: ZShapeFill(), outlineShape: ZShape(), letter: "Z")
    
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
