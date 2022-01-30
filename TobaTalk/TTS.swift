//
//  TTS.swift
//  TobaTalk
//
//  Created by Oluwatomilayo Shittu on 2022-01-30.
//

import SwiftUI
import AVFoundation

struct TTS: View {
    
    @State var word: String = ""
    
    var body: some View {
        
        TextField("Type what you want to say...", text: $word)
            .padding()
            .frame(width: 400.0, height: 100.0)
    
    }
    
    func speak()
    {
        let output = AVSpeechUtterance(string: word)
        output.voice = AVSpeechSynthesisVoice(language: "en-GB")
        output.rate = 0.55
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(output)
    }
    
}


struct TTS_Previews: PreviewProvider {
    static var previews: some View {
        TTS()
    }
}
