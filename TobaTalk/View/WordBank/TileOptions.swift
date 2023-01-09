//
//  TileOptions.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2023-01-08.
//

import SwiftUI

struct TileOptions: View {
    @ObservedObject var viewModel: TobaViewModel
    @Binding var active_tile: TobaModel.Tile
    
    var body: some View {
        Form {
            Button(active_tile.is_word ? "Delete Word" : "Delete Folder") {
                viewModel.deleteTile(active_tile)
            }
        }
        VStack {
            Text("Add to folder:")
            List {
                ForEach(viewModel.folders.filter({ $0.id != active_tile.id})) {
                    folder in
                    Button(action: {
                        print("Adding tile to folder!")
                        viewModel.addTileToFolder(active_tile, to: folder)
                    }) {
                        Text(folder.text)
                    }
                }
            }
        }
    }
}

