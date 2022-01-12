//
//  Widget_PlayerApp.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 7/1/20.
//

import SwiftUI

@main
struct Widget_PlayerApp: App {
    @StateObject var mediaController = MediaController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mediaController)
                .statusBar(hidden: true)
        }
    }
}
