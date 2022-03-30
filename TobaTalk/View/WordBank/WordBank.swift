//
//  WordBank.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-03-29.
//

import SwiftUI

struct WordBank: View {
    let gridItemLayout = Array(repeating: GridItem(), count: Int(UIScreen.main.bounds.width/130))
    @State var folders: [Folder] = FileController().getFolders()
    @State var words: [Word] = FileController().getWords()
    
    var body: some View {
        ScrollView {
            VStack {
                bar(word: "Folders")
                LazyVGrid (columns: gridItemLayout) {
                    ForEach (folders) { folder in
                        FolderView(folder: folder)
                    }
                    Button (action: {
                        
                    }) {
                        ABView(word: Word(text: "New", image: "folder.badge.plus")).foregroundColor(.blue)
                    }
                }
                Spacer().frame(height:40)
                bar(word: "Words")
                LazyVGrid (columns: gridItemLayout) {
                    ForEach (words) { word in
                        ABView(word: word)
                    }
                    Button (action: {
                        
                    }) {
                        ABView(word: Word(text: "New", image: "doc.badge.plus")).foregroundColor(.blue)
                    }
                }
            }.padding()
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

struct WordBank_Previews: PreviewProvider {
    static var previews: some View {
        WordBank()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
