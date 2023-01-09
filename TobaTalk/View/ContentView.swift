//
//  ContentView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: TobaViewModel
    
    var body: some View {
        TabView {
            ImageKeyboardView(viewModel: viewModel).tabItem{
                Image(systemName: "photo")
            }
            
            TTSView().tabItem{
                Image(systemName: "keyboard")
            }
            /*
            SettingsView().tabItem{
                Image(systemName: "gear")
            }
             */
            WordBank(viewModel: viewModel).tabItem {
                Image(systemName: "square.grid.3x1.below.line.grid.1x2")
            }
            AddPage(viewModel: viewModel).tabItem {
                Image(systemName: "doc.badge.plus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let Toba = TobaViewModel()
        ContentView(viewModel: Toba)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


