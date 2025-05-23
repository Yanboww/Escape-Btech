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
    var currentSpriteNode: SKSpriteNode = SKSpriteNode(imageNamed: "background")
    
   
    override func didMove(to view: SKView){
        setupBackground(imageName: "background", duration: 10, zPos: 1, scale: 1)
    }
    
    override func update(_ currentTime: CFTimeInterval){
        setupAnimation(layer: currentSpriteNode)
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
            
            
            
            addChild(layer)
        }
        
    }
    
    private func setupAnimation(layer: SKSpriteNode){
        let x = layer.size.width
        let move = SKAction.moveBy(x: -x, y:0, duration: 0.1)
        let wrap = SKAction.moveBy(x: x, y:0, duration: 0)
        let sequence = SKAction.sequence([move,wrap])
        print("hello")
        layer.run(sequence)
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
    
    public func moveBackground(direction: Int){
        
    }
    
    
    
    
}
