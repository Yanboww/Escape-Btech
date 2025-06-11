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
    @State private var message = "Guess secret code! If the red number reaches 0, you lose."
    @State private var showMessage = true
    @State private var rounds = 0
    @Binding var level : Int
    @State var moveOn = false
    let gameStatus = Timer.publish(every: 0.008, on: .main, in: .common).autoconnect()
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("keypad")
                    .resizable()
                    .frame(width: 450,height: 450)
                    .offset(x:geometry.size.width*0.3,y:-geometry.size.height*0.15)
                VStack{
                    Text("\(model.chancesRemaining)")
                        .foregroundStyle(.red)
                        .font(Font.custom("pixel", size: 40))
                        .offset(x:geometry.size.width*0.18,y:-geometry.size.height*0.45)
                    HStack{
                        ForEach(displayedArr, id: \.self){guess in
                            Text(String(guess))
                                .foregroundStyle(.white)
                                .font(Font.custom("dogica", size: 30))
                                .offset(x:0,y:geometry.size.height*0.05)
                        }
                    }
                    .offset(x:geometry.size.width*0.18,y:-geometry.size.height*0.48)
                    VStack {
                        HStack{
                            ForEach(0..<3){ i in
                                Button{
                                    message = model.appendCode(val: i)
                                    displayedArr = model.currentTried
                                    rounds += 1
                                } label: {
                                    ZStack{
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundStyle(.gray)
                                        Text("\(i)")
                                            .foregroundStyle(.black)
                                            .font(Font.custom("dogica", size: 15))
                                    }
                                }
                            }
                        }
                        HStack{
                            ForEach(3..<7){ i in
                                Button{
                                    message = model.appendCode(val: i)
                                    displayedArr = model.currentTried
                                    rounds += 1
                                } label: {
                                    ZStack{
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundStyle(.gray)
                                        Text("\(i)")
                                            .foregroundStyle(.black)
                                            .font(Font.custom("dogica", size: 15))
                                    }
                                }
                            }
                        }
                        HStack {
                            ForEach(7..<10){ i in
                                Button{
                                    message = model.appendCode(val: i)
                                    displayedArr = model.currentTried
                                    rounds += 1
                                } label: {
                                    ZStack{
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundStyle(.gray)
                                        Text("\(i)")
                                            .foregroundStyle(.black)
                                            .font(Font.custom("dogica", size: 15))
                                    }
                                }
                            }
                        }
                    }
                    .offset(x:geometry.size.width*0.18,y:-geometry.size.height*0.3)
                }
            }
            .offset(x:geometry.size.width*0.01,y:geometry.size.height*0.1)
            .task{
                model.generateSecretCode()
                print(model.secretCode)
            }
            if model.chancesRemaining > 0 && !message.isEmpty {
                Dialogue(window: geometry.size, name: "PENNY", dialogueText: message, displayDialogue: $showMessage, round: rounds,image:"Penny")
                    .offset(x:-geometry.size.width*0.01,y:geometry.size.height*0.25)
            }
            if model.checkGame() {
                ZStack{
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width,height: geometry.size.height)
                        .opacity(0.8)
                    Text("You Win")
                        .font(Font.custom("pixel", size: 60))
                        .foregroundStyle(.white)
                        .offset(x:0,y:-geometry.size.height*0.3)
                    Button{
                        moveOn = true
                    } label: {
                        Image("Key")
                            .resizable()
                            .frame(width: 600,height: 250)
                            .offset(x:0,y:geometry.size.height*0.15)
                    }

                }
            }
            else if model.chancesRemaining <= 0{
                ZStack{
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width,height: geometry.size.height)
                        .opacity(0.8)
                        .onTapGesture{
                            model.resetGame()
                        }
                    Text("You Lose")
                        .font(Font.custom("pixel", size: 60))
                        .foregroundStyle(.red)
                        .offset(x:0,y:-geometry.size.height*0.3)
                        .onTapGesture{
                            model.resetGame()
                        }
                }
            }
        }
        .onReceive(gameStatus){_ in
            if moveOn && level == 4{
                level = 5
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var val = 4
        var body: some  View {
            EscapeRoomView(level: $val)
        }
    }
    return Preview()
}
