//
//  SentenceBar.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct SentenceBar: View {
    @ObservedObject var viewModel: TobaViewModel
    

    var body: some View {
        VStack {
            HStack (spacing: 5) {
                Button (action: {
                    viewModel.speakSentence()
                }){
                    Spacer().frame(width: 5)
                    ForEach (viewModel.sentence) { word in
                        ABView(word: word)
                    }
                    Spacer()
                }
                .frame(height: 160)
                Button (action: {
                    viewModel.deleteWordFromSentence()
                }) {
                    Image(systemName: "delete.left.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                }
            }
        }
    }
}
