//
//  JoyStick.swift
//  Escape_Btech
//
//  Created by Student on 5/21/25.
//

import SwiftUI

struct JoyStick: View {
    var window:CGSize
    @State var direction = "N"
    var body: some View {
        let _ = print(direction)
        HStack {
            Button{
                
            } label: {
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
                        direction = "L"
                    })
                    .onEnded({ _ in
                        direction = "N"
                    })
            )
            Button{
                
            } label: {
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
                        direction = "R"
                    })
                    .onEnded({ _ in
                        direction = "N"
                    })
            )
        }
        .offset(x:-window.width*0.35,y:window.height*0.3)
        
    }
}

#Preview {
    JoyStick(window: CGSize(width: 852,height: 393))
}
