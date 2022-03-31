//
//  ImageKeyboardView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-31.
//

import SwiftUI

struct ImageKeyboardView: View {
    let fc = FileController()
    var home_folder: Folder
    @State var active_folder: Folder
    @State var sentence = [Word]()
    @State var gridItemLayout = Array(repeating: GridItem(), count: Int(UIScreen.main.bounds.width/130))
    
    init() {
        let temp = fc.getFolders().first(where: {$0.id == "Home".hash})!
        self.active_folder = temp
        self.home_folder = temp
    }
    
    var body: some View {
        VStack {
            SentenceBar(sentence: $sentence)
            HStack {
                if !(self.active_folder == home_folder) {
                    Rectangle().frame(width: 20, height: 5)
                    Button(action: {
                        self.active_folder = home_folder
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
                        ForEach (active_folder.tiles ?? []) {tile in
                            if tile.is_word {
                                let word = try! tile.getWord()
                                Button (action: {
                                    sentence.append(word)
                                }) {
                                    ABView(word: word)
                                }
                            } else {
                                let folder = try! tile.getFolder()
                                Button (action: {
                                    active_folder = folder
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
}

struct ImageKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageKeyboardView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
