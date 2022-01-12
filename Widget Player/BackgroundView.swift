//
//  BackgroundView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/25/20.
//

import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var mediaController: MediaController
    @State var degrees: Double = 0
    
    var body: some View {
        VStack {
            if let image = mediaController.image {
                Image(uiImage: image)
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
            } else {
                PlaceholderBackground()
            }
        }
        .clipShape(Circle())
        .scaledToFill()
        .opacity(0.7)
        .rotationEffect(.degrees(degrees))
        .onAppear {
            let animation = Animation.linear(duration: 10).repeatForever(autoreverses: false)
            return withAnimation(animation) {
                self.degrees = 360
            }
        }
        .blur(radius: 100)
    }
}

struct PlaceholderBackground: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .topTrailing))
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MediaController())
            .preferredColorScheme(.dark)
    }
}
