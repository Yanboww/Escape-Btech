//
//  JoyStick.swift
//  Escape_Btech
//
//  Created by Student on 5/21/25.
//

import SwiftUI

struct JoyStick: View {
    var window:CGSize
    @Binding var direction: Int
    @State var imageJumps = 0
    @State var timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Image("JOYSTICK (BOX)")
                .resizable()
                .frame(width: 250, height: 125)
                .offset()
            HStack {
                Button{
                    
                } label: {
                    //left
                    ZStack {
                        Image("JOYSTICK (LEFT)").resizable().frame(width:100,height:100)
                    }
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            direction = -1
                            
                        })
                        .onEnded({ _ in
                            direction = 0
                        })
                )
                
                Button(){
                    
                } label: {
                    //right
                    ZStack{
                        Image("JOYSTICK (RIGHT)").resizable().frame(width:100,height:100)
                    }
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            direction = 1
                            
                            
                        })
                        .onEnded({ _ in
                            direction = 0
                        })
                )
            }
        }
        .offset(x:-window.width*0.35,y:window.height*0.3)
        
    }
}

#Preview {
    struct Preview: View {
        @State var val = 0
        var body: some View {
            JoyStick(window: CGSize(width: 852,height: 393), direction: $val)
        }
    }
    return Preview()
}


