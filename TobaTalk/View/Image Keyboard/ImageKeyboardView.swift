//
//  ImageKeyboardView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-31.
//

import SwiftUI

struct ImageKeyboardView: View {
    @State var active_tile = Tile(is_word: false, folder: Folder(text: "Main", tiles: [
        Tile(is_word: true, word:Word(text: "Hello", image:"hand.wave")),
        Tile(is_word: false, folder:Folder(text: "Folder", image:"folder", tiles:[
            Tile(is_word: true, word:Word(text: "Toba", image:"eyeglasses")),
            Tile(is_word: true, word:Word(text: "Talks", image:"mouth"))
        ]))
    ]))
    @State var sentence = [Word]()
    @State var gridItemLayout = Array(repeating: GridItem(), count: Int(UIScreen.main.bounds.width/130))
    
    var body: some View {
        VStack {
            SentenceBar(sentence: $sentence)
            HStack {
                ScrollView {
                    Spacer().frame(height: 20)
                    LazyVGrid (columns: gridItemLayout) {
                        ForEach (active_tile.folder!.tiles ?? []) {tile in
                            if tile.is_word {
                                Button (action: {
                                    sentence.append(tile.word!)
                                }) {
                                    ABView(word: tile.word!)
                                }
                            } else {
                                Button (action: {
                                    active_tile = tile
                                }) {
                                    FolderView(folder: tile.folder!)
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
}

struct ImageKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageKeyboardView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
