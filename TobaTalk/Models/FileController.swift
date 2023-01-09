//
//  FileController.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2023-01-04.
//

import Foundation

struct FileController {
    init() {
        encoder.outputFormatting = .prettyPrinted
    }
    
    enum FileError: Error {
        case DefaultSettings
        case InvalidHomeID
    }
    
    let manager = FileManager.default
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    static let default_words = [
        TobaModel.Word(text: "Hello", image: "hand.wave"),
        TobaModel.Word(text: "Toba", image: "eyeglasses"),
        TobaModel.Word(text: "Talks", image: "mouth"),
        TobaModel.Word(text: "Tomi"),
        TobaModel.Word(text: "Owen")
    ]
    static let default_folders = [
        TobaModel.Folder(text: "Home", image: "house", tiles: [
            TobaModel.Tile(is_word: true, object_id: "Hello".hash),
            TobaModel.Tile(is_word: true, object_id: "Toba".hash),
            TobaModel.Tile(is_word: true, object_id: "Talks".hash),
            TobaModel.Tile(is_word: false, object_id: "Test".hash)
        ]),
        TobaModel.Folder(text: "Test", image: "folder", tiles: [
            TobaModel.Tile(is_word: true, object_id: "Owen".hash),
            TobaModel.Tile(is_word: true, object_id: "Tomi".hash)
        ])
    ]
    
    func getWords() -> [TobaModel.Word] {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("words")) {
            if let words: [TobaModel.Word] = try? decoder.decode([TobaModel.Word].self, from:jsonData) {
                return words
            }
        }
        return FileController.default_words
    }
    
    func getFolders() -> [TobaModel.Folder] {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("folders")) {
            if let folders: [TobaModel.Folder] = try? decoder.decode([TobaModel.Folder].self, from:jsonData) {
                return folders
            }
        }
        return FileController.default_folders
    }
    
    func setWords(_ words: [TobaModel.Word]) {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let json: Data = try? encoder.encode(words) {
            do {
                print(json)
                try json.write(to: url.appendingPathComponent("words"))
            } catch {
                print("Error writing to file")
            }
        }
    }
    
    func setFolders(_ folders: [TobaModel.Folder]) {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let json: Data = try? encoder.encode(folders) {
            do {
                try json.write(to: url.appendingPathComponent("folders"))
            } catch {
                print("Error writing to file")
            }
        }
    }
    
    func getHomeID() -> Int {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("homeid")) {
            if let homeID: Int = try? decoder.decode(Int.self, from:jsonData) {
                return homeID
            }
        }
        return FileController.default_folders[0].id
    }
    
    func getSettings() throws -> Settings {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let jsonData = try? Data(contentsOf: url.appendingPathComponent("settings")) {
            if let settings: Settings = try? decoder.decode(Settings.self, from:jsonData) {
                return settings
            }
        }
        throw FileError.DefaultSettings
    }
}
