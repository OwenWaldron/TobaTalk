//
//  ButtonGridView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

var words = [(word: "Hello", image:"hand.wave"), (word: "Toba", image:"eyeglasses"), (word: "Talk", image:"mouth"), (word: "Anna", image:"heart"), (word: "Tomi", image:"brain"), (word: "Owen", image:"function")]

struct ButtonGridView: View {
    var body: some View {
        VStack {
            LazyVGrid (columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach (words, id: \.self.word) { word in
                    ABView(word: Word(text: word.word, image: word.image))
                }
            }
        }
    }
}

struct ButtonGridView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGridView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
