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
    var vSample = "Hello! I am your voice. How do I sound?"
    var vRegion = "en-GB"
    var vGender = "male"
    
    var vRate = AVSpeechUtteranceDefaultSpeechRate
    var vPitch:Float = 1.0
    var vVolume:Float = 1.0
    

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
