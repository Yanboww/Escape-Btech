//
//  EscapeRoomView.swift
//  Escape_Btech
//
//  Created by Student on 5/27/25.
//

import SwiftUI

struct EscapeRoomView: View {
    let model: EscapeModel = EscapeModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 700, height: 300)
            HStack{
                ForEach(model.currentTried, id: \.self){guess in
                    Text(String(guess))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    EscapeRoomView()
}
