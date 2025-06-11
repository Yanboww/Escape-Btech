//
//  TrashGameMainView.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import SwiftUI

struct TrashGameMainView: View {
    @State var trashGameModel: TrashGameModel = TrashGameModel()
    @State var timeCounter = 60

    @State var startMessageShowing = true
    @State var playerLost = false
    @State var resetMessageShowing = false
    
    @State var backgroundX = 310
    
    @State var score100Passed = false
    @State var score250Passed = false
    @State var score500Passed = false
    @State var playerWon = false
    @Binding var level: Int
    var body: some View {
        @State var currentTimer = trashGameModel.timers[0].autoconnect()
        @State var trashTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @State var checkResetTimer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
        GeometryReader{geometry in
            
            let startDialogue = Dialogue(window: geometry.size, name: "PENNY", dialogueText: "The Key is hidden throughout the trash in the Cafe.You only have a few minutes before you're locked in!Find the key.", displayDialogue: $startMessageShowing, round: 0, image: "Penny")
            let resetDialogue = Dialogue(window: geometry.size, name: "PENNY", dialogueText: "YOU'RE LOCKED IN THIS HELL FOREVER! Tap to play again", displayDialogue: $resetMessageShowing, round: 0, image: "Penny")
            let bgImage = Image("CafeteriaFULL").resizable().ignoresSafeArea().frame(width:4511/2,height:1039/2).position(x:geometry.size.width+CGFloat(backgroundX),y:geometry.size.height-CGFloat(trashGameModel.backgroundPosition[1]))
            
            ZStack{
                bgImage.onReceive(checkResetTimer){ _ in
                    if(trashGameModel.score >= 100 && !score100Passed){
                        withAnimation(.linear(duration:0.25)){
                            backgroundX -= 725
                            score100Passed  = true
                        }
                        timeCounter = trashGameModel.timerMaxes[1]
                    }
                    else if(trashGameModel.score >= 250 && !score250Passed){
                        withAnimation(.linear(duration:0.25)){
                            backgroundX -= 725
                            score250Passed  = true
                        }
                        timeCounter = 40
                       
                    }
                    else if(trashGameModel.score >= 500 && !score500Passed){
                        score500Passed = true
                        timeCounter = 999
                        playerWon = true
                    }
                    
                    
                }
                if(trashGameModel.score < 100 && !playerWon){
                    DraggableView(image: Image("MILK CARTON"), type: 1,  imageDimensions: CGSize(width:100,height:100), geometry: geometry, frameDimension: CGPoint(x:438/4,y:578/4), trashGameModel: trashGameModel)
                    
                }else if(trashGameModel.score >= 100 && trashGameModel.score < 250 && !playerWon){
                    
                    DraggableView(image: Image("PIZZA"), type: 0,  imageDimensions: CGSize(width:100,height:100), geometry: geometry, frameDimension: CGPoint(x:760/4,y:499/4), trashGameModel: trashGameModel)
                    DraggableView(image: Image("MILK CARTON"), type: 1,  imageDimensions: CGSize(width:100,height:100), geometry: geometry, frameDimension: CGPoint(x:438/4,y:578/4), trashGameModel: trashGameModel)
                    
                }else if(trashGameModel.score < 500 && !playerWon){
                    DraggableView(image: Image("PIZZA"), type: 0,  imageDimensions: CGSize(width:100,height:100), geometry: geometry, frameDimension: CGPoint(x:760/4,y:499/4), trashGameModel: trashGameModel)
                    DraggableView(image: Image("MILK CARTON"), type: 1,  imageDimensions: CGSize(width:100,height:100), geometry: geometry, frameDimension: CGPoint(x:438/4,y:578/4), trashGameModel: trashGameModel)
                    DraggableView(image: Image("Spoon"), type: 2,  imageDimensions: CGSize(width:100,height:100), geometry: geometry, frameDimension: CGPoint(x:438/4,y:578/4), trashGameModel: trashGameModel)
                }
                if(trashGameModel.score >= 500){
                    Button(action: {
                        level = level + 1
                        print(level)
                    }){
                        Image("Key").renderingMode(.original)
                       
                    }
                    Dialogue(window: geometry.size, name: "PENNY", dialogueText: "You have found the key. Good job. Now, Move on to the next floor.", displayDialogue: $playerWon, round: 0, image: "Penny")
                }
                
                if(!startMessageShowing && !resetMessageShowing){
                    Text("Time Remaining: " + String(timeCounter))
                        .foregroundColor(.red)
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .onReceive(trashTimer){_ in
                            timeCounter -= 1
                            if(timeCounter <= 0){
                                playerLost = true
                                resetMessageShowing = true
                            }
                        }
                        .position(x:geometry.size.width-175,y:15)
                    Text("Score: " + String(trashGameModel.score))
                        .foregroundColor(.green)
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .position(x:100,y:15)
                    
                }
                
                
                startDialogue
                resetDialogue.onReceive(checkResetTimer){_ in
                    if(playerLost && !resetMessageShowing){
                        reset()
                    }
                }
                
                
                Image("COMPOST BIN").resizable().frame(width:407/3,height:397/3).position(x:geometry.size.width-trashGameModel.binLocations[0].x,y:geometry.size.height-trashGameModel.binLocations[0].y)
                
                Image("TRASH BIN").resizable().frame(width:407/3,height:397/3).position(x:geometry.size.width-trashGameModel.binLocations[1].x,y:geometry.size.height-trashGameModel.binLocations[0].y)
                Image("RECYCLE BIN").resizable().frame(width:407/3,height:397/3).position(x:geometry.size.width-trashGameModel.binLocations[2].x,y:geometry.size.height-trashGameModel.binLocations[0].y)
                
            }
            
        }.ignoresSafeArea()
        
        
        
    }
    
    
    func reset(){
        playerLost = false
        resetMessageShowing = false
        timeCounter = 60
        backgroundX = 310
        score100Passed = false
        score250Passed = false
        score500Passed = false
        trashGameModel.reset()
    }
}

#Preview {
    @Previewable @State var temp = 1
    TrashGameMainView(level: $temp)
}
