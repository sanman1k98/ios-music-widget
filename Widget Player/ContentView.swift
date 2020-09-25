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

let logger = Logger(subsystem: "com.deepstuff.Widget-Player", category: "Debug")

struct ContentView: View {
    @StateObject var mediaController = MediaController()
    
    var body: some View {
        VStack {
            ArtworkView(mediaController: mediaController)
                .padding(.top, 30)
            Spacer()
            Controls(mediaController: mediaController)
            Spacer()
        }
    }
}

struct Controls: View {
    @ObservedObject var mediaController: MediaController
    
    var body: some View {
        HStack {
            
            Button(action: {
                withAnimation {
                    mediaController.prev()
                }
            }, label: {
                Label("Previous", systemImage: "backward")
            })
            
            Button(action: {
                withAnimation {
                    mediaController.togglePlayback()
                }
            }, label: {
                Label("Play/Pause", systemImage: "playpause")
            })
            .padding(.horizontal, 30)
            
            Button(action: {
                withAnimation {
                    mediaController.skip()
                }
            }, label: {
                Label("Next", systemImage: "forward")
            })
            
        }
        .labelStyle(IconOnlyLabelStyle())
        .font(.largeTitle)
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

