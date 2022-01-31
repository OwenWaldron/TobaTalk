//
//  TTSView.swift
//  TobaTalk
//
//  Created by Oluwatomilayo Shittu on 2022-01-30.
//

import SwiftUI
import AVFoundation

struct TTSView: View {
    
    @State var word: String = ""
    
    var body: some View {
        
        VStack(alignment: .center){
        
        TextField("Type what you want to say...", text: $word).font(.system(size:40))
            .padding()
            .frame(width: 600.0, height: 100.0)
        
        RoundedRectangle(cornerRadius:10.0).fill(Color.blue).frame(width: 250, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).overlay(HStack{
            Button(action: speak){
                Text("Speak").font(.system(size:40)).foregroundColor(.white)
            }
        })
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
    
    struct TTSView_Previews: PreviewProvider {
        static var previews: some View {
            TTSView()
        }
        
    }
}
