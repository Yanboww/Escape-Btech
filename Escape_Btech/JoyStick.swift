//
//  JoyStick.swift
//  Escape_Btech
//
//  Created by Student on 5/21/25.
//

import SwiftUI

struct JoyStick: View {
    var window:CGSize
    var body: some View {
        HStack {
            Button{
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 60,height: 60)
                        .foregroundStyle(.blue)
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundStyle(.black)
                        .font(.system(size: 50))
                }
            }
            .offset(x:0,y: window.height*0.35)
            Circle()
                .size(width: 50, height: 50)
                .foregroundStyle(.blue)
                .opacity(1)
                .offset(x: window.width*0.022,y: window.height*0.77)
            Button{
                
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 60,height: 60)
                        .foregroundStyle(.blue)
                    Image(systemName: "arrowshape.forward.fill")
                        .foregroundStyle(.black)
                        .font(.system(size: 50))
                }
            }
            .offset(x:-window.width*0.62,y:window.height*0.35)
        }
        
    }
}

#Preview {
    JoyStick(window: CGSize(width: 852,height: 393))
}
