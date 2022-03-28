//
//  AudioButtonView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct Word: Identifiable, Hashable, Codable {
    var id = UUID()
    let text: String
    var image = "photo"
}

struct Folder: Identifiable, Hashable, Codable {
    var id = UUID()
    let text: String
    var image = "photo"
    var tiles: [Tile]?
}

struct Tile: Identifiable, Hashable, Codable {
    var id = UUID()
    let is_word: Bool
    var word: Word?
    var folder: Folder?
    
    @ViewBuilder func display() -> some View {
        if self.is_word {
            ABView(word: self.word!)
        } else {
            FolderView(folder: self.folder!)
        }
    }
}

struct ABView: View {
    let word: Word
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 5)
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 6)
            VStack{
                Image(systemName: word.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text(word.text).font(.largeTitle)
            }
        }
        .frame(width: 120, height: 160)
    }
}

struct FolderView: View {
    let folder: Folder
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 20)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: 5)
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: 6).foregroundColor(.black)
                    VStack{
                        Image(systemName: folder.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text(folder.text).font(.largeTitle)
                    }.foregroundColor(.black)
                }.frame(width: 120, height: 150)
            }
        }
        .frame(width: 120, height: 160)
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FolderView(folder: Folder(text: "test"))
            ABView(word: Word(text: "test"))
        }
    }
}
