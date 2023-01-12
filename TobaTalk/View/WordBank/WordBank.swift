//
//  WordBank.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-03-29.
//

import SwiftUI

struct WordBank: View {
    @ObservedObject var viewModel: TobaViewModel
    @State var showing_form = false
    @State var active_tile: TobaModel.Tile = TobaModel.Tile(is_word: true, object_id: 0)
    
    var body: some View {
        ScrollView {
            VStack {
                bar(word: "Folders")
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach (viewModel.folders) { folder in
                        Button(action: {
                            active_tile = TobaModel.Tile(is_word: false, object_id: folder.id)
                            showing_form = true
                        }) {
                            FolderView(folder: folder)
                        }
                    }
                }
                Spacer().frame(height:40)
                bar(word: "Words")
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach (viewModel.words) { word in
                        Button(action: {
                            active_tile = TobaModel.Tile(is_word: true, object_id: word.id)
                            showing_form = true
                        }) {
                            ABView(word: word)
                        }
                    }
                }
            }
            .padding()
            .sheet(isPresented: $showing_form) {
                TileOptions(viewModel: viewModel, showing_sheet: $showing_form, active_tile: $active_tile)
            }
        }
    }
}


struct bar: View {
    let word: String
    
    var body: some View {
        VStack {
            HStack {
                Rectangle().frame(width: 20, height: 5)
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: 10)
                    shape.fill().foregroundColor(.white)
                    shape.stroke()
                    Text(word).font(.largeTitle)
                }.frame(width: 123)
                Rectangle().frame(height: 5)
            }
        }
    }
}
