//
//  ScoreText.swift
//  Escape_Btech
//
//  Created by Student on 5/30/25.
//

import SwiftUI

struct ScoreText: View {
    let string: String
    let color: Color
    @State private var opacity: CGFloat = 1
    
    var body: some View {
        Text(string)
            .font(.system(size: 50, design: .monospaced))
            .foregroundStyle(color)
            .shadow(color: .black, radius: 1.5, x: 1, y: 1)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1)) {
                    opacity = 0
                }
            }
            .onChange(of: string) { oldValue, newValue in
                opacity = 1
                withAnimation(.easeIn(duration: 1)) {
                    opacity = 0
                }
            }
        
    }
}

#Preview {
    ScoreText(string: "hello", color: .green)
}

