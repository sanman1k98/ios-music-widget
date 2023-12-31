//
//  ControlsView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/25/20.
//

import SwiftUI


struct Controls: View {
    @EnvironmentObject var mediaController: MediaController
    
    var body: some View {
        HStack {
            
            // prev button
            Button(action: {
                withAnimation {
                    mediaController.prev()
                }
            }, label: {
                Label("Previous", systemImage: "backward.fill")
            })
            
            // play/pause button
            Button(action: {
                withAnimation {
                    mediaController.togglePlayback()
                }
            }, label: {
                VStack {
                    if !mediaController.playing {
                        Label("Play", systemImage: "play.fill")
                    } else {
                        Label("Pause", systemImage: "pause.fill")
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
                Label("Next", systemImage: "forward.fill")
            })
            
        }
        .foregroundColor(.white)
        .labelStyle(IconOnlyLabelStyle())
        .font(.largeTitle)
        .shadow(radius: 10)
    }
    
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MediaController())
            .preferredColorScheme(.dark)
    }
}
