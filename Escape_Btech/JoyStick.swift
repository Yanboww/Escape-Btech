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
                        .frame(width: 80,height: 80)
                        .foregroundStyle(.blue)
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundStyle(.black)
                        .font(.system(size: 50))
                }
            }
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
        }
        .offset(x:-window.width*0.35,y:window.height*0.3)
        
    }
}

#Preview {
    JoyStick(window: CGSize(width: 852,height: 393))
}
