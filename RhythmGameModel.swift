//
//  RhythmGameModel.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import Foundation

class RhythmGameModel: ObservableObject {
    @Published private(set) var score = 0
    @Published private(set) var gameOver = false
    
    @Published private(set) var arrow1Pos = CGPoint(x:40, y: 1000)
    @Published private(set) var arrow2Pos = CGPoint(x:80, y: 1000)
    @Published private(set) var arrow3Pos = CGPoint(x:120, y: 1000)
    @Published private(set) var arrow4Pos = CGPoint(x:160, y: 1000)
    
    private(set) var arrow1ClickPos = CGPoint(x: 40, y: 300)
    private(set) var arrow2ClickPos = CGPoint(x: 80, y: 300)
    private(set) var arrow3ClickPos = CGPoint(x: 120, y: 300)
    private(set) var arrow4ClickPos = CGPoint(x: 160, y: 300)
    
    
}
