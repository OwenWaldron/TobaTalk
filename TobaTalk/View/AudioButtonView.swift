//
//  AudioButtonView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct ABView: View {
    let content: String
    var image = "photo"
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
            VStack{
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text(content).font(.largeTitle)
            }
        }
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ABView(content: "test")
    }
}
