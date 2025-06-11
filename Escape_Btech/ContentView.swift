//
//  ContentView.swift
//  Escape_Btech
//
//  Created by Student on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    @State var gameLevel = 0
    var body: some View {
        GeometryReader { geometry in
            if gameLevel == 0 {
                MainMenuView(level: $gameLevel)
            }
            else if gameLevel == 1 {
                BaseGameView(imageNameLeft: "OrchestraLeft", imageNameRight: "OrchestraRight", level: $gameLevel)
            }
            else if gameLevel == 2 {
                BaseGameView(imageNameLeft: "CafeLeft", imageNameRight: "CafeRight", level: $gameLevel)
            }
            else if gameLevel == 3 {
                BaseGameView(imageNameLeft: "6Left", imageNameRight: "6Right", level: $gameLevel)
            }
            else if gameLevel == 4{
                BaseGameView(imageNameLeft: "LibraryLeft", imageNameRight: "LibraryRight", level: $gameLevel)
            }
            else{
                EndView()
            }
        }
    }
}

#Preview {
    ContentView()
}
