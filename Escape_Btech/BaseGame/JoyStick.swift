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
        HStack {
            Button{
                
            } label: {
                //left
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80,height: 80)
                        .foregroundStyle(.blue)
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundStyle(.black)
                        .font(.system(size: 50))
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
            
            Button{
                
            } label: {
                //right
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80,height: 80)
                        .foregroundStyle(.blue)
                    Image(systemName: "arrowshape.forward.fill")
                        .foregroundStyle(.black)
                        .font(.system(size: 50))
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
        .offset(x:-window.width*0.35,y:window.height*0.3)
        
    }
}


