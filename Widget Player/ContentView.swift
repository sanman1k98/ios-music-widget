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
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 250, height: 250)
                .padding(.top, 50)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    playPause()
                }
            }, label: {
                Label("Play/Pause", systemImage: "playpause")
                    .labelStyle(IconOnlyLabelStyle())
                    .font(.largeTitle)
            })
            
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
