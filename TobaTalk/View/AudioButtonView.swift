//
//  AudioButtonView.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-01-30.
//

import SwiftUI

struct AudioButtonView: View {
    let content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
            Text(content).font(.largeTitle)
        }
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AudioButtonView(content: "test")
    }
}
