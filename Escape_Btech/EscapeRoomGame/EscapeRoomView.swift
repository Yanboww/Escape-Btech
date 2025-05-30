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
    var body: some View {
        GeometryReader { geometry in
            if model.chancesRemaining == 0 {
                let _ = model.noChances()
                let _ = print("lose")
            }
            if model.checkGame(){
                let _ = model.win()
                let _ = print("win")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 700, height: 300)
                VStack{
                    Text("\(model.chancesRemaining)")
                        .foregroundStyle(.red)
                    HStack{
                        ForEach(displayedArr, id: \.self){guess in
                            Text(String(guess))
                                .foregroundStyle(.white)
                        }
                    }
                    HStack{
                        ForEach(0..<4){ i in
                            Text("___")
                                .foregroundStyle(.white)
                                .font(.system(size: 30))
                        }
                    }
                    HStack{
                        ForEach(0..<10){ i in
                            Button{
                                message = model.appendCode(val: i)
                                displayedArr = model.currentTried
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
                    Button{
                        let win = model.checkGame()
                        if win {
                            let _ = print("Win")
                        }
                        else {
                            if model.chancesRemaining > 0 {
                                message = "Try Again!"
                                model.reduceChances()
                            }
                            else{
                                let _ = print("lose")
                            }
                        }
                    } label: {
                        Text("Submit")
                    }
                }
            }
            .offset(x:geometry.size.width*0.01,y:geometry.size.height*0.1)
            .task{
                model.generateSecretCode()
                print(model.secretCode)
            }
            if model.chancesRemaining > 0 && !message.isEmpty {
                Dialogue(window: geometry.size, name: "Lock", dialogueText: message)
                    .offset(x:-geometry.size.width*0.01,y:geometry.size.height*0.25)
            }
        }
    }
}

#Preview {
    EscapeRoomView()
}
