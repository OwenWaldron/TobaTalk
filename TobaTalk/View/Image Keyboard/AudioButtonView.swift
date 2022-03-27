//
//  AudioButtonView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct Word: Identifiable, Hashable, Codable {
    var id = UUID()
    let text: String
    var image = "photo"
}

struct ABView: View {
    let word: Word
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 5)
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 6)
            VStack{
                Image(systemName: word.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text(word.text).font(.largeTitle)
            }
        }
        .frame(width: 120, height: 160)
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ABView(word: Word(text: "test"))
    }
}
