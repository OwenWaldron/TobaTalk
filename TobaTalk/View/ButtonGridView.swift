//
//  ButtonGridView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

var words = [(content: "Hello", image:"photo"), (content: "Toba", image:"photo"), (content: "Talk", image:"photo"), (content: "Anna", image:"photo"), (content: "Tomi", image:"photo"), (content: "Owen", image:"photo")]

struct ButtonGridView: View {
    var body: some View {
        VStack {
            LazyVGrid (columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach (words[0...words.count-1], id: \.self.content) { word in
                    ABView(content: word.content, image: word.image)
                }
            }
        }
    }
}

struct ButtonGridView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGridView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
