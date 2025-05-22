//
//  Dialogue.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import SwiftUI

struct Dialogue: View {
    let window:CGSize
    let dialogueText: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.black)
                .opacity(0.9)
                .frame(width: window.width, height: 100)
            Text(dialogueText)
        }
    }
}

#Preview {
    Dialogue(window:  CGSize(width: 852,height: 393), dialogueText: "Whats up my g")
}
