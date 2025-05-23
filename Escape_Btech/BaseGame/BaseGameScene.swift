//
//  BaseGameScene.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import Foundation
import SwiftUI
import SpriteKit
class BaseGameScene: SKScene{
    override func didMove(to view: SKView){
        
    }
    
    //sets up scene for landscape device
    private func setUpScene(){
        backgroundColor = SKColor(.black)
        size = view!.bounds.size
    }
    
    //sets up player
    private func setUpPlayer(){
        
    }
    //sets up background
    private func  setupBackground(imageName: String, duration: Double, zPos: CGFloat, scale: CGFloat){
        let numCopies = determineNumberOfCopies(imageName: imageName, scale: scale)
        for i in 0..<numCopies{
            let layer = SKSpriteNode(imageNamed: imageName)
            
            let heightRatio = size.height / layer.size.height
            let layerHeight = size.height * scale
            let layerWidth = layer.size.width * heightRatio * scale
            let layerSize = CGSize(width: layerWidth, height: layerHeight)
            layer.size=layerSize
            
            
            layer.position = CGPoint(x: layerSize.width * CGFloat(i), y: 0)
            layer.anchorPoint = .zero
            layer.zPosition = zPos
            
            
            let move = SKAction.moveBy(x: -layer.size.width, y:0, duration: duration)
            let wrap = SKAction.moveBy(x: layer.size.width, y:0, duration: 0)
            let sequence = SKAction.sequence([move,wrap])
            let moveForever = SKAction.repeatForever(sequence)
            layer.run(moveForever)
            
            addChild(layer)
        }
        
    }
    
    //returns number of copies based on size of image
    private func determineNumberOfCopies(imageName: String, scale:CGFloat) -> Int{
            let layer = SKSpriteNode(imageNamed: imageName)
            
            let heightRatio = size.height / layer.size.height
            let layerHeight = size.height * scale
            let layerWidth = layer.size.width * heightRatio * scale
            let layerSize = CGSize(width: layerWidth, height: layerHeight)
            layer.size=layerSize
            
            let howManyPartiallyFit = Int(ceil(size.width / layerSize.width))
            
            let howManyNeeded = howManyPartiallyFit + 1
            
            return howManyNeeded
        }

    
    
}
