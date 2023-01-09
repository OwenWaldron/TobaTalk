//
//  ImageKeyboardView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-31.
//

import SwiftUI

struct ImageKeyboardView: View {
    @ObservedObject var viewModel: TobaViewModel
    
    var body: some View {
        VStack {
            SentenceBar(viewModel: viewModel)
            DividerLine(viewModel: viewModel)
            ImageKeyboard(viewModel: viewModel)
        }
    }
}


struct DividerLine: View {
    @ObservedObject var viewModel: TobaViewModel
    
    var body: some View {
        HStack {
            if !viewModel.isHome {
                Rectangle().frame(width: 20, height: 5)
                Button(action: {
                    viewModel.goHome()
                }, label: {
                    ZStack {
                        let shape = RoundedRectangle(cornerRadius: 5)
                        shape.fill().foregroundColor(.white)
                        shape.stroke()
                        Text("Home").font(.largeTitle)
                    }
                }).frame(width: 100, height: 50)
            }
            Rectangle().frame(height: 5)
        }.frame(height: 50)
    }
}


struct ImageKeyboard: View {
    @ObservedObject var viewModel: TobaViewModel
    
    var body: some View {
        HStack {
            ScrollView {
                Spacer().frame(height: 20)
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach (viewModel.display_tiles) { tile in
                        if tile.is_word {
                            let word = viewModel.tileToWord(tile)
                            Button (action: {
                                viewModel.addWord(word)
                            }) {
                                ABView(word: word)
                            }
                        } else {
                            let folder = viewModel.tileToFolder(tile)
                            Button (action: {
                                viewModel.goToFolder(folder)
                            }) {
                                FolderView(folder: folder)
                            }
                        }
                    }
                }
                Spacer()
            }
        }.padding()
        Spacer()
    }
}
