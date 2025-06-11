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
                        print(joystick.direction)
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
                        print("Interact")
                    } label: {
                        Image("InteractButton")
                            .resizable()
                            .frame(width: 100,height: 100)
                    }
                    .offset(x:-300,y:0)
                }
                joystick
                SpriteView(scene:scene, options: [.allowsTransparency])
                    .offset(x:300,y:0)
            }
            
        }.ignoresSafeArea()
        
        
    }
        
}

#Preview {
    BaseGameView(imageNameLeft: "LibraryLeft", imageNameRight: "LibraryRight")
}
