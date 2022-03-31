//
//  SettingsFile.swift
//  TobaTalk
//
//  Created by Oluwatomilayo Shittu on 2022-03-27.
//

import Foundation
import SwiftUI
import AVFoundation

struct Settings: Codable
{
<<<<<<< HEAD
    var vInput = "Hello! I am your voice. How do I sound?"
    var vVoice: String = "Daniel"
    
    var vRate = AVSpeechUtteranceDefaultSpeechRate
    var vPitch:Float = 1.0
    var vVolume:Float = 1.0
=======
    var vIdentifier: String = "Daniel"
    var vRate: Float = AVSpeechUtteranceDefaultSpeechRate
    var vPitch: Float = 1.0
    var vVolume: Float = 1.0
>>>>>>> 45c1778bfdab8431ef7f1d33756eb4ac2f64be33
    
    mutating func checkMemory() {
        let fc = FileController()
        if let settings: Settings = try? fc.loadSettings() {
            self = settings
        }
    }

    func speakInput() {
        let spokenOutput = AVSpeechUtterance(string: vInput)
     
        spokenOutput.rate = vRate
        spokenOutput.pitchMultiplier = vPitch
        spokenOutput.volume = vVolume
        
        spokenOutput.voice = AVSpeechSynthesisVoice(identifier: vVoice)
     
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(spokenOutput)
    }
    
    /* mutating func loadSettings() -> Bool {
        
        if let theRate: Float = userDefaults.valueForKey("vRate") as? Float {
            vRate = theRate
            vPitch = userDefaults.valueForKey("vPitch") as Float
            vVolume = userDefaults.valueForKey("vVolume") as Float

            return true
        }

        return false
    }
    
    // helppp */
}
