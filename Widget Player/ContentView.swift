//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI
import MediaPlayer


struct ContentView: View {
    @State private var playing = false
    let mediaController = MPMusicPlayerController.systemMusicPlayer

    var body: some View {
        
        VStack {
            Rectangle()
                .fill(playing ? Color.white : Color.gray)
                .frame(width: 250, height: 250)
                .padding(.top, 50)
            
            Spacer()
            
            HStack {
                Button("Play") {
                    withAnimation {
                        playing = true
                        mediaController.play()
                    }
                }
                Button("Pause") {
                    withAnimation {
                        playing = false
                        mediaController.pause()
                    }
                }
            }
            
            Spacer()
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
