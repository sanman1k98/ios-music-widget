//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI
import os
import MediaPlayer

let logger = Logger(subsystem: "com.deepstuff.Widget-Widget_Player", category: "UI")


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
            
            Button("Play/Pause") {
                withAnimation {
                    playing.toggle()
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
