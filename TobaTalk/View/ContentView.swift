//
//  ContentView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ImageKeyboardView().tabItem{
                Image(systemName: "photo")
            }
            TTSView().tabItem{
                Image(systemName: "keyboard")
            }
            SettingsView().tabItem{
                Image(systemName: "gear")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad (9th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


