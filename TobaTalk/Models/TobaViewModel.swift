//
//  TobaModel.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2023-01-04.
//

import Foundation
import AVFoundation

// This is the ViewModel for the TobaTalks app
class TobaViewModel: ObservableObject {
    
    @Published private var model: TobaModel = TobaModel()
    
    var sentence: [TobaModel.Word] {
        return model.sentence
    }
    
    var folders: [TobaModel.Folder] {
        return model.folders
    }
    
    var words: [TobaModel.Word] {
        return model.words
    }
    
    var display_tiles: [TobaModel.Tile] {
        return model.active_folder.tiles ?? []
    }
    
    var isHome: Bool {
        return (model.active_folder == model.home_folder)
    }
    
    var voices: [TobaModel.IDVoice] {
        return model.getVoices()
    }
    
    var chosenVoice: TobaModel.IDVoice {
        return TobaModel.IDVoice(voice: model.settings.voice)
    }
    
    var rate: Float {
        return model.settings.vRate
    }
    
    var pitch: Float {
        return model.settings.vPitch
    }
    
    var volume: Float {
        return model.settings.vVolume
    }
    
    // MARK: - Intents()
    
    func tile_press(_ tile: TobaModel.Tile) {
        model.on_keyboard_tap(tile)
    }
    
    func speakSentence() {
        model.speakSentence()
    }
    
    func addWord(_ word: TobaModel.Word) {
        model.addSentenceWord(word)
    }
    
    func goToFolder(_ folder: TobaModel.Folder) {
        model.changeActive(folder)
    }
    
    func deleteWordFromSentence() {
        model.removeWord()
    }
    
    func goHome() {
        model.changeActive(model.home_folder)
    }
    
    func tileToWord(_ tile: TobaModel.Tile) -> TobaModel.Word {
        return (try? model.getWord(tile)) ?? model.words[0]
    }
    
    func tileToFolder(_ tile: TobaModel.Tile) -> TobaModel.Folder {
        return (try? model.getFolder(tile)) ?? model.folders[0]
    }
    
    func addWord(name: String, image: String) {
        model.addWord(TobaModel.Word(text: name, image: image))
    }
    
    func addFolder(name: String, image: String) {
        model.addFolder(TobaModel.Folder(text: name, image:image))
    }
    
    func deleteTile(_ tile: TobaModel.Tile) {
        model.deleteTile(tile)
    }
    
    func addTileToFolder(_ tile: TobaModel.Tile, to folder: TobaModel.Folder) {
        model.addTileToFolder(tile, to: folder)
    }
    
    func getFoldersContaingTile(_ tile: TobaModel.Tile) -> [TobaModel.Folder] {
        return model.getFoldersContainigTile(tile)
    }
    
    func removeTileFromFolder(_ tile: TobaModel.Tile, from folder: TobaModel.Folder) {
        model.removeTileFromFolder(tile, from: folder)
    }
    
    func resetDefaultWords() {
        model.resetWordsToDefault()
    }
    
    func resetDefaultSettings() {
        model.resetSettingsToDefault()
    }
    
    func changeVoice(to voice: TobaModel.IDVoice) {
        model.setVoice(voice)
    }
    
    func changeRate(to rate: Float) {
        model.setRate(rate)
    }
    
    func changeVolume(to volume: Float) {
        model.setVolume(volume)
    }
    
    func changePitch(to pitch: Float) {
        model.setPitch(pitch)
    }
    
    func speak(_ phrase: String) {
        model.speak(phrase)
    }
}
