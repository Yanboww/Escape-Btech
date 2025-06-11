//
//  EscapeModel.swift
//  Escape_Btech
//
//  Created by Student on 5/23/25.
//

import Foundation

class EscapeModel: ObservableObject{
    @Published private(set) var secretCode: [Int] = [0,0,0,0]
    @Published private(set) var currentTried: [Int] = []
    @Published private(set) var chancesRemaining = 6
    @Published private(set) var gameState = 0
    
    func generateSecretCode(){
        secretCode[0] = Int.random(in: 0..<10)
        secretCode[1] = Int.random(in: 0..<10)
        secretCode[2] = Int.random(in: 0..<10)
        secretCode[3] = Int.random(in: 0..<10)
    }
    
    func checkCode(current:Int) -> Int{
        let latest = currentTried.count
        let supposed = secretCode[latest]
        if current < supposed {
            return -1
        }
        else if current > supposed {
            return 1
        }
        return 0
    }
    
    func appendCode(val:Int) -> String{
        if chancesRemaining > 0 && currentTried.count < 4 {
            let result = checkCode(current: val)
            if result == 0{
                currentTried.append(val)
                return "Doing good! You feel that this number must be correct."
            }
            else if result > 0 {
                chancesRemaining -= 1
                return "Something tells you this number is too big!"
            }
            else {
                chancesRemaining -= 1
                return "Something tell you this number is too small!"
            }
        }
        return ""
    }
    
    func checkGame() -> Bool {
        if secretCode == currentTried {
            return true
        }
        return false
    }
    
    func reduceChances() {
        chancesRemaining -= 1
    }
    
    func noChances() {
        gameState = -1
    }
    
    func win(){
        gameState = 1
    }
    
    func resetGame(){
        generateSecretCode()
        currentTried = []
        chancesRemaining = 6
        gameState = 0
    }
}
