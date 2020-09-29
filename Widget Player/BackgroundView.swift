//
//  BackgroundView.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/25/20.
//

import SwiftUI

struct BackgroundView: View {
    @State var rotation: Double = 0
    
    var body: some View {
        Image(systemName: "arrow.triangle.2.circlepath")
            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
            .scaledToFit()
            .frame(width: 360, height: 360, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                let animation = Animation.linear(duration: 4).repeatForever(autoreverses: false)
                return withAnimation(animation) {
                    self.rotation = 360
                }
            }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
