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
    var body: some View {
        @State var image1 = Image("download")
            
        @State var image2 = Image("download")
        GeometryReader { geometry in
            let  scene = BaseGameScene(direction: $joyStickDirection, size: geometry.size)
            let joystick = JoyStick(window: geometry.size, direction: $joyStickDirection)
    
            
            ZStack{
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                image1.resizable().ignoresSafeArea().position(x: xPos, y:yPos)
                    .onReceive(timer){ _ in
                        print(joystick.direction)
                        if(joyStickDirection == 1 && xPos > -355){
                            withAnimation(.linear(duration:0.25)){ xPos -= 50}
                        }else if(joyStickDirection == -1 && xPos < 450){
                            withAnimation(.linear(duration:0.25)){ xPos += 50}
                        }
                        
                    }
                image2.resizable().ignoresSafeArea().position(x: xPos + 750, y: yPos)
                if(xPos <= -350){
                    Image("INTERACT NOTICE").resizable().frame(width:36,height:106.32).offset(x:100,y:-100)
                }
                joystick
                SpriteView(scene:scene, options: [.allowsTransparency])
                    .offset(x:300,y:0)
            }
            
        }.ignoresSafeArea()
        
        
    }
        
}

#Preview {
    BaseGameView()
}
