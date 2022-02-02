//
//  SentenceBar.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI
import AVFoundation

struct SentenceBar: View {
    @Binding var sentence: [Word]

    var body: some View {
        VStack {
            HStack (spacing: 5) {
                Button (action: {
                    var message = ""
                    for word in sentence {
                        message += word.text+" "
                    }
                    let output = AVSpeechUtterance(string: message)
                    output.voice = AVSpeechSynthesisVoice(language: "en-GB")
                    output.rate = 0.55
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(output)
                }){
                    Spacer().frame(width: 5)
                    ForEach (sentence) { word in
                        ABView(word: word)
                    }
                    Spacer()
                }
                .frame(height: 160)
                Button (action: {
                    sentence.removeLast()
                }) {
                    Image(systemName: "delete.left.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                }
            }
            Rectangle().frame(height: 5)
        }
    }
}
