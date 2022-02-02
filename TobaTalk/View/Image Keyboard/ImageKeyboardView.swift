//
//  ImageKeyboardView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-31.
//

import SwiftUI

struct ImageKeyboardView: View {
    var words = [
        Word(text: "Hello", image:"hand.wave"),
        Word(text: "Toba", image:"eyeglasses"),
        Word(text: "Talk", image:"mouth"),
        Word(text: "Anna", image:"heart"),
        Word(text: "Tomi", image:"brain"),
        Word(text: "Owen", image:"function"),
        Word(text: "Gabby", image:"trash.circle"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle")
    ]
    @State var sentence = [Word]()
    
    var body: some View {
        VStack {
            SentenceBar(sentence: $sentence)
            VStack {
                LazyVGrid (columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
                    ForEach (words) {word in
                        Button (action: {
                            sentence.append(word)
                        }) {
                            ABView(word: word)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct ImageKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageKeyboardView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
