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
    var vIdentifier: String = "com.apple.ttsbundle.Daniel-compact"
    var vRate: Float = AVSpeechUtteranceDefaultSpeechRate
    var vPitch: Float = 1.0
    var vVolume: Float = 1.0
    
    var voice: AVSpeechSynthesisVoice {
        AVSpeechSynthesisVoice(identifier: vIdentifier) ?? AVSpeechSynthesisVoice(language: "en-GB")!
    }
}
