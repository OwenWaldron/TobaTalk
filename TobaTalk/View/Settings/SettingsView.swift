//
//  SettingsView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-02-02.
//

import SwiftUI
import AVFoundation

<<<<<<< HEAD
//let SF = Settings()
=======
let vSample = "Hello! I am your voice. How do I sound?"
>>>>>>> 45c1778bfdab8431ef7f1d33756eb4ac2f64be33

struct SettingsView: View {

    var object = AVSpeechSynthesisVoice.speechVoices()
    
    @State var s = Settings()
    
    var body: some View {
        NavigationView {
            VStack{
                Text("TobaTalks \n Settings").font(.system(size:40)).frame(height: 100)
            List{
                NavigationLink("Voice")
                {
                    List{
                        Picker("Voice", selection: $s.vVoice){
                            ForEach(object, id: \.self){
                                if $0.language.contains("en"){
                                    Text($0.name + " (" + $0.language + ")")
                                }
                            }
                        }
                        
    // Add: Rate of Speech Slider, Pitch (deeper, higher, etc.), Volume?
                        Text("You chose: \(s.vVoice).")
                    }
                    
                }
                NavigationLink("Buttons")
                {
                    Button(action:{
                        s.speakInput()
                    })
                    {
                        Text("Speak")
                    }
                }
                NavigationLink("Settings 3")
                {
                    List{
                        Text("Hello").font(.system(size:40)).frame(height: 75.0)
                        Text("Hello").font(.system(size:40)).frame(height: 75.0)
                    }
                }
                
            }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
