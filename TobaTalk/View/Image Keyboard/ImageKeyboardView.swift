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
        Word(text: "Tomi", image:"brain"),
        Word(text: "Owen", image:"function"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Owen", image:"function"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Talk", image:"mouth"),
        Word(text: "Tomi", image:"brain"),
        Word(text: "Owen", image:"function"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Owen", image:"function"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle"),
        Word(text: "Yes", image:"checkmark.circle"),
        Word(text: "No", image:"xmark.circle")
    ]
    @State var sentence = [Word]()
    @State var gridItemLayout = Array(repeating: GridItem(), count: Int(UIScreen.main.bounds.width/130))
    
    var body: some View {
        VStack {
            SentenceBar(sentence: $sentence)
            HStack {
                ScrollView {
                    Spacer().frame(height: 20)
                    LazyVGrid (columns: gridItemLayout) {
                        ForEach (words) {word in
                            Button (action: {
                                sentence.append(word)
                            }) {
                                ABView(word: word)
                            }
                        }
                    }
                    Spacer()
                }.padding()
            }
            Spacer()
        }
    }
}

struct ImageKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageKeyboardView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
