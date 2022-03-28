//
//  SettingsView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-02-02.
//

import SwiftUI


struct SettingsView: View {
    
    enum Voice: String, CaseIterable, Identifiable {
        case girl, boy, kid
        var id: Self { self }
    }
    @State private var selectedVoice: Voice = .girl

    var body: some View {
        NavigationView {
            VStack{
                Text("TobaTalks \n Settings").font(.system(size:40)).frame(height: 100)
            List{
                NavigationLink("Voice")
                {
                    List{
                        Picker("Voice", selection: $selectedVoice){
                            Text("Girl").tag(Voice.girl)
                            Text("Boy").tag(Voice.boy)
                            Text("Kid").tag(Voice.kid)
                        }
                        Text("Add: Language, More voices, Rate of Speech Slider, Pitch (deeper, higher, etc.), Volume?")
                    }
                }
                NavigationLink("Buttons")
                {
                    List{
                        Text("Hey").font(.system(size:40)).frame(height: 75.0)
                        Text("Hey").font(.system(size:40)).frame(height: 75.0)
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
