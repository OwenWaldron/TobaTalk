//
//  FileController.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-03-27.
//

import Foundation

class FileController {
    let manager = FileManager.default
    let url: URL
    let encoder = JSONEncoder()
    let default_tile = Tile(is_word: false, folder: Folder(text: "Main", tiles: [
        Tile(is_word: true, word:Word(text: "Hello", image:"hand.wave")),
        Tile(is_word: false, folder:Folder(text: "Folder", image:"folder", tiles:[
            Tile(is_word: true, word:Word(text: "Toba", image:"eyeglasses")),
            Tile(is_word: true, word:Word(text: "Talks", image:"mouth"))
        ]))
    ]))
    
    init() {
        self.url = manager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        encoder.outputFormatting = .prettyPrinted
    }
    
    func getWords() {
        let json: Data? = try? encoder.encode(default_tile)
        print(String(data: json!, encoding: .utf8)!)
    }
}
