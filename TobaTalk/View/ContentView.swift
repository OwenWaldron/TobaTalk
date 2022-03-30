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
            WordBank().tabItem {
                Image(systemName: "square.grid.3x1.below.line.grid.1x2")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


