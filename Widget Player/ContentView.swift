//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI
import MediaPlayer


struct ContentView: View {
    let mediaController = MPMusicPlayerController.systemMusicPlayer

    var body: some View {
        
        VStack {
            Spacer()
            
            Button("Play/Pause") {
                withAnimation {
                    playPause()
                }
            }
            Spacer()
        }
    }
    
    private func playPause() {
        if mediaController.playbackState == .playing {
            mediaController.pause()
        } else if !mediaController.isPreparedToPlay {
            mediaController.prepareToPlay()
            mediaController.play()
        } else {
            mediaController.play()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
