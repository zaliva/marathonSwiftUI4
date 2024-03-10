//
//  ContentView.swift
//  Marafon14(AnimatedButtonWithButtonStyle)
//
//  Created by ViktorM1Max on 10.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("") { }
            .buttonStyle(NextTrackButtonStyle())
            .frame(width: 50, height: 30)
            .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        print("tapped")
                    }
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
