//
//  ButtonGridView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

var words = ["Hello", "Toba", "Talk", "Anna", "Tomi", "Owen"]

struct ButtonGridView: View {
    var body: some View {
        VStack {
            LazyVGrid (columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach (words[0...words.count-1], id: \.self) { word in
                    AudioButtonView(content: word)
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
