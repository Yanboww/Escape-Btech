//
//  Dialogue.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import SwiftUI

struct Dialogue: View {
    let window:CGSize
    let name: String
    let dialogueText: String
    @State var displayDialogue = true
    let round: Int
    var body: some View {
        let _ = print(round)
        ZStack {
            if displayDialogue {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.black)
                    .opacity(0.8)
                    .frame(width: window.width, height: window.height*0.35)
                    .onTapGesture(count: 1) {
                        displayDialogue = false
                    }
                Text(name)
                    .foregroundStyle(.cyan)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .offset(x:-window.width*0.45,y:-window.height*0.1)
                Text(dialogueText)
                    .foregroundStyle(.white)
                    .offset(x:0,y:window.height*0.05)
                    .font(.system(size: 20))
                    .onTapGesture(count: 1) {
                        displayDialogue = false
                    }
                Image(systemName: "chevron.down")
                    .foregroundStyle(.cyan)
                    .offset(x:window.width*0.45,y:window.height*0.15)
                    .font(.system(size: 20))
            }
        }
        .offset(x:0,y:-window.height*0.25)
        .onChange(of: round){
            displayDialogue = true
        }
    }
}

#Preview {
    Dialogue(window:  CGSize(width: 852,height: 393),name:"Perry", dialogueText: "The meaning of tung tung sahur. 'Tung Tung Sahur' is a traditional custom unique to Indonesia during the month of Ramadan, in which 'Tung Tung' is a onomatopoeic word that imitates the sound of hitting drums", round: 0)
}
