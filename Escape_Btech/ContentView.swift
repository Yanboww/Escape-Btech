//
//  ContentView.swift
//  Escape_Btech
//
//  Created by Student on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let gameModel = RhythmGameModel()
        GeometryReader { geometry in
            VStack {
                RhythmGameMainView()
                    .environmentObject(gameModel)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
