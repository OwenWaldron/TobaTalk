//
//  TobaModels.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2023-01-04.
//

import Foundation
import SwiftUI
import AVFoundation


// This file contains the TobaTalks models

struct TobaModel {
    private(set) var active_folder: Folder
    private(set) var home_folder: Folder
    private(set) var sentence: [Word] = []
    private(set) var words: [Word]
    private(set) var folders: [Folder]
    private var fc = FileController()
    
    
    init() {
        let fc = FileController()
        self.words = fc.getWords()
        self.folders = fc.getFolders()
        self.home_folder = folders.first(where: {$0.id == fc.getHomeID()}) ?? folders[0]
        self.active_folder = self.home_folder
    }
    
    mutating func on_keyboard_tap(_ tile: Tile) {
        if tile.is_word{
            try? active_folder = getFolder(tile)
        } else {
            try? sentence.append(getWord(tile))
        }
    }

    mutating func removeWord() {
        if !sentence.isEmpty {
            sentence.removeLast()
        }
    }
    
    let synthesizer = AVSpeechSynthesizer()
    func speakSentence() {
        var message = ""
        for word in sentence {
            message += word.text + " "
        }
        
        let output = AVSpeechUtterance(string: message)
        let voice = AVSpeechSynthesisVoice(language: "en-GB")
        output.voice = voice
        output.rate = 0.55
        synthesizer.speak(output)
    }

    mutating func addSentenceWord(_ word: Word) {
        sentence.append(word)
    }
    
    
    mutating func changeActive(_ folder: Folder) {
        active_folder = folder
    }
    
    
    func getWord(_ tile: Tile) throws -> Word {
        if !tile.is_word {
            throw Tile.TileError.WrongType
        }
        if let word = words.first(where: {$0.id == tile.object_id}) {
            return word
        } else {
            throw TobaModel.Tile.TileError.InvalidID
        }
    }
    
    func getFolder(_ tile: Tile) throws -> Folder {
        if tile.is_word {
            throw Tile.TileError.WrongType
        }
        
        if let folder = folders.first(where: {$0.id == tile.object_id}) {
            return folder
        } else {
            throw TobaModel.Tile.TileError.InvalidID
        }
    }
    
    func getHomeFolder() -> Folder {
        return folders.first ?? FileController.default_folders.first!
    }
    
    
    mutating func saveFolders() {
        fc.setFolders(folders)
        home_folder = getHomeFolder()
        active_folder = home_folder
    }
    
    func saveWords() {
        fc.setWords(words)
    }
    
    
    mutating func addWord(_ word: Word) {
        words.append(word)
        saveWords()
    }
    
    mutating func addFolder(_ folder: Folder) {
        folders.append(folder)
        saveFolders()
    }
    
    mutating func deleteTile(_ tile: Tile) {
        words = words.filter({ word in
            word.id != tile.id
        })
        saveWords()
        
        var new_folders: [Folder] = []
        for folder in folders {
            if folder.id != tile.id {
                new_folders.append(
                    Folder(
                        text: folder.text,
                        image: folder.image,
                        tiles: folder.tiles?.filter({ tole in
                            tole.id != tile.id
                        })
                    )
                )
            }
        }
        folders = new_folders
        saveFolders()
    }
    
    mutating func addTileToFolder(_ tile: Tile, to fldr: Folder) {
        var new_folders: [Folder] = []
        var flr = fldr
        flr.tiles?.append(tile)
        for folder in folders {
            if folder.id == fldr.id {
                new_folders.append(flr)
            } else {
                new_folders.append(folder)
            }
        }
        folders = new_folders
        saveFolders()
    }
    
    
    
    // MARK: - Structures()
    
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
    }
}
