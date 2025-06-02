//
//  EscapeRoomView.swift
//  Escape_Btech
//
//  Created by Student on 5/27/25.
//

import SwiftUI

struct EscapeRoomView: View {
    @ObservedObject var model: EscapeModel = EscapeModel()
    @State private var displayedArr : [Int] = []
    @State private var message = ""
    @State private var rounds = 0
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 700, height: 300)
                    .foregroundStyle(.gray)
                VStack{
                    Text("\(model.chancesRemaining)")
                        .foregroundStyle(.red)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150,height: 60)
                        HStack{
                            ForEach(displayedArr, id: \.self){guess in
                                Text(String(guess))
                                    .foregroundStyle(.white)
                                    .font(.system(size: 30))
                                    .offset(x:0,y:geometry.size.height*0.02)
                            }
                        }
                    }
                    HStack{
                        ForEach(0..<10){ i in
                            Button{
                                message = model.appendCode(val: i)
                                displayedArr = model.currentTried
                                rounds += 1
                            } label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 20,height: 20)
                                    Text("\(i)")
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                    }
                }
            }
            .offset(x:geometry.size.width*0.01,y:geometry.size.height*0.1)
            .task{
                model.generateSecretCode()
                print(model.secretCode)
            }
            if model.chancesRemaining > 0 && !message.isEmpty {
                Dialogue(window: geometry.size, name: "Lock", dialogueText: message, round: rounds)
                    .offset(x:-geometry.size.width*0.01,y:geometry.size.height*0.25)
            }
            if model.chancesRemaining == 0 {
                let _ = model.noChances()
                let _ = print("lose")
            }
            if model.checkGame(){
                let _ = model.win()
                let _ = print("win")
            }
        }
    }
}

#Preview {
    EscapeRoomView()
}
