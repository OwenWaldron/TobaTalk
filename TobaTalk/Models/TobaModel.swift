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
    private(set) var settings: Settings
    private var fc = FileController()
    
    
    
    init() {
        let fc = FileController()
        self.words = fc.getWords()
        self.folders = fc.getFolders()
        self.home_folder = folders.first(where: {$0.id == fc.getHomeID()}) ?? folders[0]
        self.active_folder = self.home_folder
        self.settings = fc.getSettings()
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
    let samplePhrase = "Hello Toba Talks"
    func speak(_ message: String) {
        let output = AVSpeechUtterance(string: message)
        output.voice = settings.voice
        output.rate = settings.vRate
        output.pitchMultiplier = settings.vPitch
        output.volume = settings.vVolume
        synthesizer.speak(output)
    }
    
    func speakSentence() {
        var message = ""
        for word in sentence {
            message += word.text + " "
        }
        speak(message)
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
    
    func saveSettings() {
        fc.setSettings(settings)
        speak(samplePhrase)
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
                        tiles: folder.tiles.filter({ tole in
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
        print(folders)
        print(fldr)
        var new_folders: [Folder] = []
        var flr = fldr
        flr.tiles.append(tile)
        print(flr)
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
    
    
    mutating func removeTileFromFolder(_ tile: Tile, from fldr: Folder) {
        var flr = fldr
        flr.tiles.removeAll(where: { $0.id == tile.id })
        
        var new_folders: [Folder] = []
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
    
    func getFoldersContainigTile(_ tile: Tile) -> [Folder] {
        var output: [Folder] = []
        for folder in folders {
            if folder.tiles.contains(tile) {
                output.append(folder)
            }
        }
        return output
    }
    
    func getVoices() -> [IDVoice] {
        var voices: [IDVoice] = []
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Karen-compact") {
            voices.append(IDVoice(voice: voice, name: "Karen"))
        }
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact") {
            voices.append(IDVoice(voice: voice, name: "Daniel"))
        }
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_en-AU_compact") {
            voices.append(IDVoice(voice: voice, name: "Cathrine"))
        }
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_male_en-AU_compact") {
            voices.append(IDVoice(voice: voice, name: "Gordon"))
        }
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_male_en-US_compact") {
            voices.append(IDVoice(voice: voice, name: "Aaron"))
        }
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Samantha-compact") {
            voices.append(IDVoice(voice: voice, name: "Samantha"))
        }
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.speech.synthesis.voice.Hysterical") {
            voices.append(IDVoice(voice: voice, name: "Laughy"))
        }
        return voices
    }
    
    mutating func setVoice(_ voice: IDVoice) {
        settings.vIdentifier = voice.id
        saveSettings()
    }
    
    mutating func setRate(_ rate: Float) {
        settings.vRate = rate
        saveSettings()
    }
    
    mutating func setVolume(_ volume: Float) {
        settings.vVolume = volume
        saveSettings()
    }
    
    mutating func setPitch(_ pitch: Float) {
        settings.vPitch = pitch
        saveSettings()
    }
    
    mutating func resetWordsToDefault() {
        words = FileController.default_words
        folders = FileController.default_folders
        saveWords()
        saveFolders()
    }
    
    mutating func resetSettingsToDefault() {
        settings = Settings()
        saveSettings()
    }
    
    
    
    // MARK: - Structures()
    
    struct Word: Identifiable, Hashable, Codable {
        let text: String
        var image = "photo"
        var id: Int {
            return text.hash
        }
    }

    struct Folder: Identifiable, Hashable, Codable {
        let text: String
        var image = "photo"
        var tiles: [Tile] = []
        var id: Int {
            return ("folder%" + text).hash
        }
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
    
    
    struct IDVoice: Identifiable {
        let voice: AVSpeechSynthesisVoice
        var name: String = ""
        var id: String {
            return voice.identifier
        }
    }
}
