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
    var vIdentifier: String = "Daniel"
    var vRate: Float = AVSpeechUtteranceDefaultSpeechRate
    var vPitch: Float = 1.0
    var vVolume: Float = 1.0
    
    mutating func checkMemory() {
        let fc = FileController()
        if let settings: Settings = try? fc.loadSettings() {
            self = settings
        }
    }

    func speakSample(sender: AnyObject) {
        let sampleOutput = AVSpeechUtterance(string: vSample)
     
        sampleOutput.rate = vRate
        sampleOutput.pitchMultiplier = vPitch
        sampleOutput.volume = vVolume
     
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(sampleOutput)
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
