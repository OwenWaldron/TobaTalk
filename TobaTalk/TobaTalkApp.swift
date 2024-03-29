//
//  TobaTalkApp.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

@main
struct TobaTalkApp: App {
    let Toba = TobaViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: Toba)
        }
    }
}
