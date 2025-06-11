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
    var body: some View {
        @State var image1 = Image(imageNameLeft)
            
        @State var image2 = Image(imageNameRight)
        GeometryReader { geometry in
            let  scene = BaseGameScene(direction: $joyStickDirection, playerPos: $xPos, size: geometry.size)
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
                        }
                        
                    }
                image2.resizable().ignoresSafeArea().position(x: xPos + 870, y: yPos)
                if(xPos <= -350){
                    Image("INTERACT NOTICE").resizable().frame(width:36,height:106.32).offset(x:200,y:-100)
                    Button{
                        showGame.toggle()
                    } label: {
                        Image("InteractButton")
                            .resizable()
                            .frame(width: 100,height: 100)
                    }
                    .offset(x:-geometry.size.width*0.35,y:0)
                }
                joystick
                SpriteView(scene:scene, options: [.allowsTransparency])
                    .offset(x:300,y:0)
                if showGame {
                    if level == 1{
                        RhythmGameMainView(level: $level)
                            .environmentObject(RhythmGameModel())
                    }
                    else if level == 2 {
                        TrashGameMainView(level: $level)
                    }
                    else if level == 3 {
                        TheOneAndOnly(level: $level)
                    }
                    else if level == 4 {
                        EscapeRoomView(level: $level)
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
            BaseGameView(imageNameLeft: "LibraryLeft", imageNameRight: "LibraryRight", level: $val)
        }
    }
    return Preview()
}
