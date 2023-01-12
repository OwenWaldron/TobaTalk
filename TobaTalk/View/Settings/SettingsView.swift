//
//  SettingsView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-02-02.
//

import SwiftUI
import AVFoundation

struct SettingsView: View {
    @ObservedObject var viewModel: TobaViewModel
    @State var pitch: Float
    @State var rate: Float
    @State var volume: Float
    @State var showing_alert = false
    @State var deleting = ""
    
    init(viewModel: TobaViewModel) {
        self.viewModel = viewModel
        self.pitch = viewModel.pitch
        self.rate = viewModel.rate
        self.volume = viewModel.volume
    }
    
    func getFromVM(_ viewModel: TobaViewModel) {
        self.pitch = viewModel.pitch
        self.rate = viewModel.rate
        self.volume = viewModel.volume
    }
    
    var body: some View {
        Form {
            Section ("Speech rate") {
                Slider (value: $rate, in: 0...1, onEditingChanged: { editing in
                    if !editing {
                        viewModel.changeRate(to: rate)
                    }
                })
            }
            Section ("Volume") {
                Slider (value: $volume, in: 0...1, onEditingChanged: { editing in
                    if !editing {
                        viewModel.changeVolume(to: volume)
                    }
                })
            }
            Section ("Pitch") {
                Slider (value: $pitch, in: 0...1, onEditingChanged: { editing in
                    if !editing {
                        viewModel.changePitch(to: pitch)
                    }
                })
            }
            Section ("Voice") {
                List {
                    ForEach(viewModel.voices) { voice in
                        Button(voice.name) {
                            viewModel.changeVoice(to: voice)
                        }.font(Font.headline.weight(viewModel.chosenVoice.id == voice.id ? .bold : .regular))
                    }
                }
            }
            Button("Reset words and folders to defaults") {
                deleting = "words"
                showing_alert.toggle()
            }.foregroundColor(.red)
            Button("Reset voice settings to defaults") {
                deleting = "settings"
                showing_alert.toggle()
            }.foregroundColor(.red)
        }.alert("Are you sure?", isPresented: $showing_alert) {
            HStack {
                Button("No") {
                    showing_alert.toggle()
                }
                Button("Yes") {
                    showing_alert.toggle()
                    if deleting == "words" {
                        viewModel.resetDefaultWords()
                        getFromVM(viewModel)
                    }
                    if deleting == "settings" {
                        viewModel.resetDefaultSettings()
                        getFromVM(viewModel)
                    }
                }
            }
        }
    }
}
