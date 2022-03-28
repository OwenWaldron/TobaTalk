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
    let decoder = JSONDecoder()
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
    
    func getWords() -> Tile {
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("words")) {
            if let words: Tile = try? decoder.decode(Tile.self, from:jsonData) {
                return words
            }
        }
        return default_tile
    }
    
    func saveWords(words: Tile) {
        if let json: Data = try? encoder.encode(default_tile) {
            do {
                try json.write(to: url.appendingPathComponent("words"))
            } catch {
                print("Error writing to file")
            }
        }
    }
}
