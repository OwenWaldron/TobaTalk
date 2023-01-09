//
//  AudioButtonView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

let HEIGHT: CGFloat = 160

func getImageFromString(_ name: String) -> Image {
    if name.starts(with: "custom_image") {
        return Image(systemName: "photo")
    } else {
        return Image(systemName: name)
    }
}

struct ABView: View {
    let word: TobaModel.Word
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 5)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 6)
            VStack{
                getImageFromString(word.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text(word.text).font(.title)
            }
        }
        .frame(height: HEIGHT)
    }
}

struct FolderView: View {
    let folder: TobaModel.Folder
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 20)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: 5)
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 6).foregroundColor(.black)
                    VStack{
                        getImageFromString(folder.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text(folder.text).font(.title)
                    }.foregroundColor(.black)
                }
            }
        }
        .frame(height: HEIGHT)
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FolderView(folder: TobaModel.Folder(text: "Folder", image: "Image"))
            ABView(word: TobaModel.Word(text: "e"))
        }
    }
}
