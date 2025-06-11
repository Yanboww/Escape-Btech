//
//  EndView.swift
//  Escape_Btech
//
//  Created by Student on 6/11/25.
//

import SwiftUI

struct EndView: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Rectangle()
                    .foregroundStyle(.black)
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width,height: geometry.size.height)
                VStack {
                    Text("End of part 1...")
                        .foregroundStyle(.red)
                        .font(Font.custom("dogica", size: 40))
                    Text("Thanks for playing")
                        .font(Font.custom("dogica", size: 40))
                        .foregroundStyle(.white)
                }
                    
            }
        }
    }
}

#Preview {
    EndView()
}
