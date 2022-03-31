//
//  AudioButtonView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct Word: Identifiable, Hashable, Codable {
    let text: String
    var image = "photo"
    var id: Int { return text.hash }
}

struct Folder: Identifiable, Hashable, Codable {
    let text: String
    var image = "photo"
    var tiles: [Tile]?
    var id: Int { return text.hash }
}

struct Tile: Identifiable, Hashable, Codable {
    enum TileError: Error {
        case WrongType
        case InvalidID
    }
    
    let is_word: Bool
    var object_id: Int
    var id: Int { return object_id }
    
    func getWord() throws -> Word {
        if !is_word {
            throw Tile.TileError.WrongType
        }
        let fc = FileController()
        if let word = fc.getWords().first(where: {$0.id == object_id}) {
            return word
        } else {
            throw Tile.TileError.InvalidID
        }
    }
    
    func getFolder() throws -> Folder {
        if is_word {
            throw Tile.TileError.WrongType
        }
        let fc = FileController()
        if let folder = fc.getFolders().first(where: {$0.id == object_id}) {
            return folder
        } else {
            throw Tile.TileError.InvalidID
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
                Text(word.text).font(.title)
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
                        Text(folder.text).font(.title)
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
