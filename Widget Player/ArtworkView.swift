//
//  ArtworkView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/12/20.
//

import SwiftUI

struct ArtworkView: View {
    @EnvironmentObject var mediaController: MediaController
    
    var body: some View {
        VStack {
            if let image = mediaController.image {
                Image(uiImage: image)
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .scaledToFit()
            } else {
                placeholderArtwork()
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct placeholderArtwork: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .topTrailing))
            .overlay(
                Image(systemName: "music.note")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .scaledToFit()
                    .padding(.all, 40)
                    .shadow(radius: 10)
            )
    }
}

struct ArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MediaController())
            .preferredColorScheme(.dark)
    }
}
