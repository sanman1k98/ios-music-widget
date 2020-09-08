//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI
import Foundation
import MediaPlayer
import os

let mediaController = MPMusicPlayerController.systemMusicPlayer
let logger = Logger(subsystem: "com.deepstuff.Widget-Player", category: "Debug")

struct ContentView: View {
    var body: some View {
        VStack {
            ArtworkView()
                .padding(.top, 30)
            Spacer()
            Controls()
            Spacer()
        }
    }
}

struct Artwork: View {
    var body: some View {
        VStack {
            if let artwork = mediaController.nowPlayingItem?.artwork {
                let image = artwork.image(at: artwork.bounds.size)
                Image(uiImage: image!)
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .scaledToFit()
            } else {
                placeholderArtwork()
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct placeholderArtwork: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .topTrailing))
            .overlay(
                Image(systemName: "music.quarternote.3")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .scaledToFit()
                    .padding(.all, 40)
                    .shadow(radius: 10)
            )
    }
}

struct Controls: View {
    var body: some View {
        HStack {
            
            Button(action: {
                withAnimation {
                    return
                }
            }, label: {
                Label("Previous", systemImage: "backward")
            })
            
            Button(action: {
                withAnimation {
                    playPause()
                }
            }, label: {
                Label("Play/Pause", systemImage: "playpause")
            })
            .padding(.horizontal, 30)
            
            Button(action: {
                withAnimation {
                    mediaController.skipToNextItem()
                }
            }, label: {
                Label("Next", systemImage: "forward")
            })
            
        }
        .labelStyle(IconOnlyLabelStyle())
        .font(.largeTitle)
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
        }
    }
}

