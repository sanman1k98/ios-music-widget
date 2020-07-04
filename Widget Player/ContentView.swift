//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 250, height: 250)
                .padding(.top, 50)
            Spacer()
            Text("Hello, world!").padding()
            Button("Play/Pause", action: playPause)
            Spacer()
        }
        
    }
}

func playPause() {
    return
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
