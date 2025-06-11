//
//  BaseGameView.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import SwiftUI
import SpriteKit
struct BaseGameView: View {
    @State var xPos: CGFloat = 0
    @State var yPos: CGFloat = 200
    @State var joyStickDirection: Int = 0
    @State var timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    @State var inRangeForPopup = false
    @State var imageNameLeft:String
    @State var imageNameRight:String
    @State var showGame = false
    @Binding var level:Int
    @State var random = true
    @State var offsetBy = 0
    var exclamationPoint: Int
    var body: some View {
        @State var image1 = Image(imageNameLeft)
            
        @State var image2 = Image(imageNameRight)
        GeometryReader { geometry in
            let  scene = BaseGameScene(direction: $joyStickDirection, playerPos: $xPos, size: geometry.size)
            let pennyScene = PennySprite()
            let joystick = JoyStick(window: geometry.size, direction: $joyStickDirection)
    
            
            ZStack{
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                image1.resizable().ignoresSafeArea().position(x: xPos, y:yPos)
                    .onReceive(timer){ _ in
                        if(joyStickDirection == 1 && xPos > -450){
                            withAnimation(.linear(duration:0.25)){ xPos -= 60}
                        }else if(joyStickDirection == -1 && xPos < 480){
                            withAnimation(.linear(duration:0.25)){ xPos += 60}
                            offsetBy += 60
                        }
                        
                    }
                image2.resizable().ignoresSafeArea().position(x: xPos + 870, y: yPos)
                if(xPos <= -350){
                    Image("INTERACT NOTICE").resizable().frame(width:36,height:106.32).position(x:CGFloat(exclamationPoint),y:100)
                    Button{
                        showGame.toggle()
                    }
                    label: {
                        Image("InteractButton")
                            .resizable()
                            .frame(width: 125,height: 125)
                    }
                    .offset(x:300,y:100)
                    .zIndex(100)
                    
                }
                joystick
                    .zIndex(99)
                if level == 3 {
                    SpriteView(scene: pennyScene,options: [.allowsTransparency])
                        .position(x:xPos+700,y:200)
                }
                SpriteView(scene:scene, options: [.allowsTransparency])
                    .offset(x:300,y:0)
                if showGame {
                    if level == 1{
                        RhythmGameMainView(level: $level)
                            .environmentObject(RhythmGameModel())
                            .zIndex(101)
                    }
                    else if level == 2 {
                        TrashGameMainView(level: $level)
                            .zIndex(101)
                    }
                    else if level == 3 {
                        TheOneAndOnly(level: $level)
                            .offset(x:-700,y:-100)
                            .zIndex(101)
                    }
                    else if level == 4 {
                        EscapeRoomView(level: $level)
                            .zIndex(101)
                    }
                }
            }
            
        }.ignoresSafeArea()
        
        
    }
        
}

#Preview {
    struct Preview: View {
        @State var val = 1
        var body: some  View {
            BaseGameView(imageNameLeft: "LibraryLeft", imageNameRight: "LibraryRight", level: $val, exclamationPoint: 200)
        }
    }
    return Preview()
}
