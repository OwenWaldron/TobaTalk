//
//  ContentView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

func speak()
{
    
    let output = AVSpeechUtterance(string: word)
    output.voice = AVSpeechSynthesisVoice(language: "en-GB")
    output.rate = 0.55
    
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(output)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
