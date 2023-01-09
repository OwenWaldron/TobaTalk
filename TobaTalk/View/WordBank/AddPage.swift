//
//  AddPage.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-03-30.
//

import SwiftUI

struct AddPage: View {
    @ObservedObject var viewModel: TobaViewModel
    @State private var showing_alert = false
    @State private var is_word: Bool = true
    @State private var name = ""
    @State private var image = ""
    
    
    var body: some View {
        Form {
            Section(header: Text(is_word ? "Add Word" : "Add Folder")) {
                Toggle(is_word ? "Word" : "Folder", isOn: $is_word)
                TextField(text: $name, prompt: Text(is_word ? "Word" : "Folder Name"), label: {
                    Text("Name")
                })
                TextField(text: $image, prompt: Text("Image Name"), label: {
                    Text("Image Name")
                })
                Button("Create") {
                    if is_word {
                        viewModel.addWord(name: name, image: image)
                    } else {
                        viewModel.addFolder(name: name, image: image)
                    }
                    name = ""
                    image = ""
                    showing_alert.toggle()
                }
            }
        }
        .alert(is_word ? "Added Word" : "Added Folder", isPresented: $showing_alert) {
            Button("Ok") {
                showing_alert.toggle()
            }
        }
    }
}
