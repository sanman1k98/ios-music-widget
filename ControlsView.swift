//
//  ControlsView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/25/20.
//

import SwiftUI


struct Controls: View {
    @ObservedObject var mediaController: MediaController
    
    var body: some View {
        HStack {
            
            // prev button
            Button(action: {
                withAnimation {
                    mediaController.prev()
                }
            }, label: {
                Label("Previous", systemImage: "backward")
            })
            
            // play/pause button
            Button(action: {
                withAnimation {
                    mediaController.togglePlayback()
                }
            }, label: {
                VStack {
                    if !mediaController.playing {
                        Label("Play", systemImage: "play")
                    } else {
                        Label("Pause", systemImage: "pause")
                    }
                }
            })
            .padding(.horizontal, 30)
            
            // skip button
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

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
