//
//  FileController.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-03-27.
//

import Foundation
import AVFoundation

class FileController {
    let manager = FileManager.default
    let url: URL
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let default_words = [
        Word(text: "Hello", image: "hand.wave"),
        Word(text: "Toba", image: "eyeglasses"),
        Word(text: "Talks", image: "mouth"),
        Word(text: "Tomi"),
        Word(text: "Owen")
    ]
    let default_folders = [
        Folder(text: "Home", image: "house", tiles: [
            Tile(is_word: true, object_id: "Hello".hash),
            Tile(is_word: true, object_id: "Toba".hash),
            Tile(is_word: true, object_id: "Talks".hash),
            Tile(is_word: false, object_id: "Test".hash)
        ]),
        Folder(text: "Test", image: "folder", tiles: [
            Tile(is_word: true, object_id: "Owen".hash),
            Tile(is_word: true, object_id: "Tomi".hash)
        ])
    ]
    
    enum FileError: Error {
        case DefaultSettings
    }
    
    init() {
        self.url = manager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        encoder.outputFormatting = .prettyPrinted
    }
    
    func getWords() -> [Word] {
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("words")) {
            if let words: [Word] = try? decoder.decode([Word].self, from:jsonData) {
                return words
            }
        }
        return default_words
    }
    
    func getFolders() -> [Folder] {
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("folder")) {
            if let folders: [Folder] = try? decoder.decode([Folder].self, from:jsonData) {
                return folders
            }
        }
        return default_folders
    }
    
    func addWord(word: Word) {
        if let json: Data = try? encoder.encode(getWords() + [word]) {
            do {
                try json.write(to: url.appendingPathComponent("words"))
            } catch {
                print("Error writing to file")
            }
        }
    }
    
    func removeWord(word: Word) {
        
    }
    
    func loadSettings() throws -> Settings {
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("settings")) {
            if let settings: Settings = try? decoder.decode(Settings.self, from:jsonData) {
                return settings
            }
        }
        throw FileError.DefaultSettings
    }
}
