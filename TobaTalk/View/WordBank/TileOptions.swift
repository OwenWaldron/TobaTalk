//
//  TileOptions.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2023-01-08.
//

import SwiftUI

struct TileOptions: View {
    @ObservedObject var viewModel: TobaViewModel
    @Binding var showing_sheet: Bool
    @Binding var active_tile: TobaModel.Tile
    @State var showing_alert = false
    @State var alert_message = ""
    
    var body: some View {
        Form {
            Button(active_tile.is_word ? "Delete Word" : "Delete Folder") {
                viewModel.deleteTile(active_tile)
                alert_message = "Deleted " + (active_tile.is_word ? "word" : "folder")
                showing_alert = true
            }
            Section ("Add to folder:") {
                List {
                    ForEach(viewModel.folders.filter({ $0.id != active_tile.id})) {
                        folder in
                        Button(action: {
                            viewModel.addTileToFolder(active_tile, to: folder)
                            alert_message = "Added to folder"
                            showing_alert = true
                        }) {
                            Text(folder.text)
                        }
                    }
                }
            }
            Section ("Remove from folder") {
                List {
                    ForEach(viewModel.getFoldersContaingTile(active_tile)) {
                        folder in
                        Button(action: {
                            viewModel.removeTileFromFolder(active_tile, from: folder)
                            alert_message = "Removed from folder"
                            showing_alert = true
                        }) {
                            Text(folder.text)
                        }
                    }
                }
            }
        }.alert(alert_message, isPresented: $showing_alert) {
            Button("Ok") {
                showing_alert.toggle()
                showing_sheet.toggle()
            }
        }
    }
}

