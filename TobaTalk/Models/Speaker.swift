//
//  Speaker.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2023-01-04.
//

import Foundation
import AVFoundation

class Speaker: NSObject, AVSpeechSynthesizerDelegate {
    let synthesizer = AVSpeechSynthesizer()
    override init() {
        synthesizer.delegate = self
    }

    func speak(msg: String) {
        let utterance = AVSpeechUtterance(string: msg)

        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8
        
        let voice = AVSpeechSynthesisVoice(language: "en-US")

        utterance.voice = voice
        synthesizer.speak(utterance)
    }
}
