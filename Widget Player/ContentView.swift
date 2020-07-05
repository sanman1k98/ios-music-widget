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
        ContentView()
            .preferredColorScheme(.dark)
    }
}
