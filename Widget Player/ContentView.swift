//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI
import MediaPlayer
import os

let mediaController = MPMusicPlayerController.systemMusicPlayer
let logger = Logger(subsystem: "com.deepstuff.Widget-Player", category: "Debug")

struct ContentView: View {
    var body: some View {
        VStack {
            Artwork()
                .padding(.top, 30)
            Spacer()
            Controls()
            Spacer()
        }
    }
    
    
}

struct Artwork: View {
    var body: some View {
        Image(uiImage: (currentArtwork() ?? UIImage(systemName: "music.note"))! )
            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
    }
    
    private func currentArtwork() -> UIImage? {
        var artwork :UIImage?
        artwork = mediaController.nowPlayingItem?.artwork?.image(at: CGSize(width: 300, height: 300))
        logger.log("\(artwork.debugDescription)")
        return artwork
    }
    
}

struct Controls: View {
    var body: some View {
        Button(action: {
            withAnimation {
                playPause()
            }
        }, label: {
            Label("Play/Pause", systemImage: "playpause")
                .labelStyle(IconOnlyLabelStyle())
                .font(.largeTitle)
        })
    }
    
    private func playPause() {
            switch mediaController.playbackState {
            case .playing:
                mediaController.pause()
            case .paused, .stopped, .interrupted:
                mediaController.play()
            default:
                mediaController.play()
            }
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            Artwork()
                .previewLayout(.sizeThatFits)
        }
    }
}
