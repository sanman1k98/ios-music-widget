//
//  InfoView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/25/20.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var mediaController: MediaController
    
    var body: some View {
        VStack {
            if let songTitle = mediaController.songTitle {
                Text(songTitle)
            } else {
                Text("No song playing")
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
