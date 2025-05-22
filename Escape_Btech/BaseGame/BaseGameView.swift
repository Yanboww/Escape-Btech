//
//  BaseGameView.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import SwiftUI
import SpriteKit
struct BaseGameView: View {
    var scene = BaseGameScene()
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                SpriteView(scene:scene).ignoresSafeArea()
                JoyStick(window: geometry.size)
            }
            
            
        }
    }
        
}

#Preview {
    BaseGameView()
}
