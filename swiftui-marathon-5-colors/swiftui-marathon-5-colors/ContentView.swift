//
//  ContentView.swift
//  swiftui-marathon-5-colors
//
//  Created by Vladislav Shakhray on 12/10/2023.
//

import SwiftUI

extension CGSize {
    static func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        return .init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
struct ContentView: View {
    @State private var initialOffset: CGSize = .zero
    @State private var offset: CGSize = .zero
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                Color.white.blendMode(.darken)
                Color.pink.colorInvert()
                Color.yellow.blendMode(.darken)
                Color.clear
            }
            .ignoresSafeArea()
            .allowsHitTesting(false)
            
            Color.black
                .clipShape(RoundedRectangle(cornerRadius: 18.0))
                .frame(width: 100, height: 100)
                .offset(offset)
            
                .gesture(
                    DragGesture()
                        .onChanged { newValue in
                            offset = initialOffset + newValue.translation
                        }
                        .onEnded { newValue in
                            initialOffset = initialOffset + newValue.translation
                        }
                )
            
            VStack(spacing: 0.0) {
                Color.white.blendMode(.darken)
                Color.white.blendMode(.difference)
                Color.white.blendMode(.darken)
                Color.white.blendMode(.difference)
            }
            .ignoresSafeArea()
            .allowsHitTesting(false)
            
    
        }
    }
}

#Preview {
    ContentView()
}
