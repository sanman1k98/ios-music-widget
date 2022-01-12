//
//  InfoView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/25/20.
//

import SwiftUI

struct InfoView: View {
    @EnvironmentObject var mediaController: MediaController
    
    var body: some View {
        VStack {
            if let songTitle = mediaController.songTitle {
                Text(songTitle)
            } else {
                Text("No song playing")
            }
        }
        .font(.title)
        .lineLimit(1)
        .shadow(radius: 10)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MediaController())
            .preferredColorScheme(.dark)
    }
}
