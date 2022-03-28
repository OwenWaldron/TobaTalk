//
//  SettingsView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-02-02.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("TobaTalks \n Settings").font(.system(size:40)).frame(height: 100)
            List{
                NavigationLink("Voice")
                {
                    List{
                        Text("Hi").font(.system(size:40)).frame(height: 75.0)
                        Text("Hi").font(.system(size:40)).frame(height: 75.0)
                        Text("Hi").font(.system(size:40)).frame(height: 75.0)
                        Text("Hi").font(.system(size:40)).frame(height: 75.0)
                        Text("Hi").font(.system(size:40)).frame(height: 75.0)
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


    func openVoice()
    {
        
    }

    func openSet()
    {
        
    }

    func goBack()
    {
        
    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
