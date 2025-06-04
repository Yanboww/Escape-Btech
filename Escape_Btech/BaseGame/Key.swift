//
//  Key.swift
//  Escape_Btech
//
//  Created by Student on 6/2/25.
//

import SwiftUI

struct Key: View {
    @State var Stage: String
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 900,height: 500)
            VStack{
                Text("You beat the \(Stage)!")
                    .foregroundStyle(.white)
                    .font(.system(size: 40))
                Image("Key")
                    .resizable()
                    .frame(width: 200,height: 100)
                Text("You can now move on to the next level")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                Text("Tap to dismiss")
                    .foregroundStyle(.gray)
                    .offset(x:0,y:60)
            }
            
        }
    }
}

#Preview {
    Key(Stage: "Rhyme Game")
}
