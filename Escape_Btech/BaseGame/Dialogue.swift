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
    @Binding var displayDialogue: Bool
    let round: Int
    let image : String
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
                Image(image)
                    .resizable()
                    .frame(width: 200,height: 200)
                    .offset(x:-window.width*0.4,y:0)
                Text(name)
                    .foregroundStyle(.cyan)
                    .fontWeight(.bold)
                    .font(Font.custom("pixel", size: 25))
                    .offset(x:-window.width*0.24,y:-window.height*0.12)
                Text(dialogueText)
                    .foregroundStyle(.white)
                    .offset(x:window.width*0.05,y:window.height*0.05)
                    .font(Font.custom("pixel", size: 20))
                    .lineLimit(nil)
                    .frame(width: 500)
                    .onTapGesture(count: 1) {
                        displayDialogue = false
                    }
                Image(systemName: "chevron.down")
                    .foregroundStyle(.cyan)
                    .offset(x:window.width*0.4,y:window.height*0.15)
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
    struct Preview: View {
        @State var boolean = true
        var body: some  View {
            Dialogue(window:  CGSize(width: 852,height: 393),name:"Penny", dialogueText: "The meaning of tung tung sahur. 'Tung Tung Sahur' is a traditional custom unique to Indonesia during the month of Ramadan, in which 'Tung Tung' is a onomatopoeic word that imitates the sound of hitting drums", displayDialogue: $boolean, round: 0,image: "Penny")
        }
    }
    return Preview()
}
