//
//  EscapeModel.swift
//  Escape_Btech
//
//  Created by Student on 5/23/25.
//

import Foundation

class EscapeModel {
    @Published private(set) var secretCode: [Int] = [0,0,0,0]
    
    func generateSecretCode(){
        secretCode[0] = Int.random(in: 0..<10)
        secretCode[1] = Int.random(in: 0..<10)
        secretCode[2] = Int.random(in: 0..<10)
        secretCode[3] = Int.random(in: 0..<10)
    }
    
    
    
}
