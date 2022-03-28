//
//  ImageKeyboardView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-31.
//

import SwiftUI

let home_tile = FileController().default_tile

struct ImageKeyboardView: View {
    let fc = FileController()
    @State var active_tile = home_tile
    @State var sentence = [Word]()
    @State var gridItemLayout = Array(repeating: GridItem(), count: Int(UIScreen.main.bounds.width/130))
    
    init() {
        self.active_tile = fc.getWords()
    }
    
    var body: some View {
        VStack {
            SentenceBar(sentence: $sentence)
            HStack {
                if !(self.active_tile==home_tile) {
                    Rectangle().frame(width: 20, height: 5)
                    Button(action: {
                        self.active_tile = home_tile
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
