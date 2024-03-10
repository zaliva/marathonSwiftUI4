//
//  NextTrackButton.swift
//  Marafon14(AnimatedButtonWithButtonStyle)
//
//  Created by ViktorM1Max on 10.03.2024.
//

import SwiftUI

struct NextTrackButtonStyle: ButtonStyle {
    private let buttonImage = Image(systemName: "play.fill").resizable()
    @Namespace private var animation
    @State private var isPressed: Bool = false
    @State private var isScaleDown: Bool = false
    
    private let duration = 0.22
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader(content: { geometry in
            Group {
                if !isPressed {
                    HStack(spacing: 0) {
                        buttonImage.matchedGeometryEffect(id: "Shape1", in: animation)
                            .frame(width: 0, height: 0)
                            .opacity(0)
                        buttonImage.matchedGeometryEffect(id: "Shape2", in: animation)
                        buttonImage.matchedGeometryEffect(id: "Shape3", in: animation)
                    }
                } else {
                    HStack(spacing: 0) {
                        buttonImage.matchedGeometryEffect(id: "Shape1", in: animation)
                        buttonImage.matchedGeometryEffect(id: "Shape2", in: animation)
                        buttonImage.matchedGeometryEffect(id: "Shape3", in: animation)
                            .frame(width: 0, height: 0)
                            .opacity(0)
                    }
                }
            }
            .background {
                Circle()
                    .fill(.gray.opacity(isPressed ? 0.3 : 0.0))
                    .frame(width: geometry.size.width * 1.4, height: geometry.size.width * 1.4)
            }
            .scaleEffect(isScaleDown ? 0.86 : 1)
            .onTapGesture {
                withAnimation(.linear(duration: duration)) {
                    self.isPressed = true
                } completion: {
                    self.isPressed = false
                }
                
                withAnimation(.linear(duration: duration*0.5)) {
                    self.isScaleDown = true
                } completion: {
                    withAnimation(.linear(duration: duration*0.5)) {
                        self.isScaleDown = false
                    }
                }
            }
        })
    }
}

#Preview {
    Button("") { }
    .buttonStyle(NextTrackButtonStyle())
    .frame(width: 70, height: 40)
}
