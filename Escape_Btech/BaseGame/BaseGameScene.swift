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
    private let player = SKSpriteNode(imageNamed: "tile000")
    var direction: Int = 0
    
    override func didMove(to view: SKView){
        //setUpScene()
        setUpPlayer()
    }
    
    //sets up scene for landscape device
    private func setUpScene(){
        backgroundColor = .clear
    }
    
    override func update(_ currentTime: TimeInterval){
        if direction == 1 {
            player.zPosition = 0
            runAnimation()
        }
        else if direction == -1 {
            player.zPosition = 180
            runAnimation()
        }
    }
    //sets up player
    private func setUpPlayer(){
        player.position = CGPoint(x:0 ,y: 0)
        /*player.zPosition = 4
        player.setScale(3)
        idleAnimation()**/
        addChild(player)
    }
    
    private func idleAnimation(){
        let textureAtlas = SKTextureAtlas(named: "MasonIdle")
        var playerAnimation = [SKTexture]()
        for i in 0..<textureAtlas.textureNames.count {
            let name = "tile00\(i)"
            playerAnimation.append(textureAtlas.textureNamed(name))
        }
        let animation = SKAction.animate(with: playerAnimation, timePerFrame: 0.15)
        let repeatForever = SKAction.repeatForever(animation)
        player.run(repeatForever)
    }
    
    private func runAnimation(){
        let textureAtlas = SKTextureAtlas(named: "MasonRun")
        var playerAnimation = [SKTexture]()
        for i in 0..<textureAtlas.textureNames.count {
            let name = "run00\(i)"
            playerAnimation.append(textureAtlas.textureNamed(name))
        }
        let animation = SKAction.animate(with: playerAnimation, timePerFrame: 0.15)
        let repeatForever = SKAction.repeatForever(animation)
        player.run(repeatForever)
    }
    

    
    
}
