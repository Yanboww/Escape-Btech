//
//  RhythmGameModel.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import Foundation
import SwiftUI

struct ModelConstants {
    static let arrowDimensions = CGFloat(60)
}

class RhythmGameModel: ObservableObject {
    @Published private(set) var score = 0
    @Published private(set) var gameOver = false
    @Published private(set) var isWon = false
    @Published var clickArrows: [Arrow] =
    [
        Arrow(position: CGPoint(x: 80, y: 300), sequence: [], isEnabled: true, image: .arrowLeft),
        Arrow(position: CGPoint(x: 160, y: 300), sequence: [], isEnabled: true, image: .arrowDown),
        Arrow(position: CGPoint(x: 240, y: 300), sequence: [], isEnabled: true, image: .arrowUp),
        Arrow(position: CGPoint(x: 320, y: 300), sequence: [], isEnabled: true, image: .arrowRight),
    ]
    @Published var arrows: [Arrow] =
    [
        Arrow(position: CGPoint(x:80, y: 1000), sequence: [40, -280, -450, 10, -150, -140, -10000, -10000], isEnabled: false, image: .arrowLeft),
        Arrow(position: CGPoint(x:160, y: 1000), sequence: [-45, -280, -280, -240, -100, -105, -10000, -10000], isEnabled: false, image: .arrowDown),
        Arrow(position: CGPoint(x:240, y: 1000), sequence: [-130, -280, -110, -240, -100, -195, -10000, -10000], isEnabled: false, image: .arrowUp),
        Arrow(position: CGPoint(x:320, y: 1000), sequence: [-215, -280, 60, -240, -240, -55, -10000, -10000], isEnabled: false, image: .arrowRight),
        Arrow(position: CGPoint(x:80, y: 1000), sequence: [-555, -280, -175, 90, -260, -10000, -10000], isEnabled: false, image: .arrowLeft),
        Arrow(position: CGPoint(x:160, y: 1000), sequence: [-470, -280, -175, -240, -110, -10000, -10000], isEnabled: false, image: .arrowDown),
        Arrow(position: CGPoint(x:240, y: 1000), sequence: [-385, -280, -175, -240, -195, -10000, -10000], isEnabled: false, image: .arrowUp),
        Arrow(position: CGPoint(x:320, y: 1000), sequence: [-300, -280, -175, -240, -185, -10000, -10000], isEnabled: false, image: .arrowRight),
    ]
    @Published var scoreList: [String] = [""]
    @Published var scoreCount = 1
    
    private(set) var timer = Timer.publish(every: 0.008, on: .main, in: .common).autoconnect()
    
    func moveArrows() {
        if gameOver {return}
        
        for i in 0..<arrows.count {
            arrows[i].position.y += 1.5
        }
    }
    
    func updateArrows() {
        for i in 0..<arrows.count {
            if arrows[i].position.y >= 400 {
                arrows[i].position.y = arrows[i].sequence[arrows[i].index]
                if arrows[i].index < arrows[i].sequence.count - 1 {
                    arrows[i].index += 1
                    print("\(arrows[i].sequence) \(arrows[i].index)")
                }
                if arrows[i].index != 0 && arrows[i].isEnabled {
                    scoreList.append("Yikes")
                    incrementScoreCount(string: "Yikes")
                }
                arrows[i].isEnabled = true
            }
        }
        gameOver = isGameOver()
    }
    
    func arrowClicked(arrow: Arrow) {
        var closest:Arrow = Arrow(position: CGPoint(x:10000, y: 10000), sequence: [], isEnabled: false, image: .arrowDown)
        var closestIdx = 0
        
        for i in 0..<arrows.count {
            if arrows[i].position.x == arrow.position.x {
                if abs(arrows[i].position.y - (arrow.position.y)) < abs(closest.position.y - (arrow.position.y)) {
                    closest = arrows[i]
                    closestIdx = i
                }
            }
        }
        if abs(arrows[closestIdx].position.y - (arrow.position.y + 40)) < 15 && arrows[closestIdx].isEnabled {
            score += 100
            scoreList.append("Perfect!")
            incrementScoreCount(string: "Perfect!")
            arrows[closestIdx].isEnabled = false
        } else if abs(arrows[closestIdx].position.y - (arrow.position.y + 40)) < 35 && arrows[closestIdx].isEnabled {
            score += 50
            scoreList.append("Good")
            incrementScoreCount(string: "Good")
            arrows[closestIdx].isEnabled = false
        } else if abs(arrows[closestIdx].position.y - (arrow.position.y + 40)) < 50 && arrows[closestIdx].isEnabled {
            score += 25
            scoreList.append("Meh")
            incrementScoreCount(string: "Meh")
            arrows[closestIdx].isEnabled = false
        }
    }
    
    func isGameOver() -> Bool {
        for i in 0..<arrows.count {
            if arrows[i].index != arrows[i].sequence.count - 1 {
                return false
            }
        }
        isGameWon()
        return true
    }
    
    func isGameWon() {
        if gameOver {
            if score >= 1900 {
                isWon = true
            } else {
                isWon = false
            }
        }
    }
    
    func incrementScoreCount(string: String) {
        if scoreList[scoreList.count - 2] == string {
            scoreCount += 1
        } else {
            scoreCount = 1
        }
    }
    
    @ViewBuilder func displayScored(text: String) -> some View {
        if text == "Perfect!" {
            ScoreText(string: "Perfect! \(scoreCount)", color: .green)
        } else if text == "Good" {
            ScoreText(string: "Good \(scoreCount)", color: .yellow)
        } else if text == "Meh" {
            ScoreText(string: "Meh \(scoreCount)", color: .orange)
        } else if text == "Yikes" {
            ScoreText(string: "Yikes \(scoreCount)", color: .red)
        } else {
            ScoreText(string: "", color: .white)
        }
    }
}
