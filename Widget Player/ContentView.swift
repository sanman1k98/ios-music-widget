//
//  ContentView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI
import Foundation
import os

let logger = Logger(subsystem: "com.deepstuff.Widget-Player", category: "Debug")

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ArtworkView()
                    .padding(.top, 30)
                InfoView()
                Spacer()
                Controls()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(MediaController())
                .preferredColorScheme(.dark)
        }
    }
}

