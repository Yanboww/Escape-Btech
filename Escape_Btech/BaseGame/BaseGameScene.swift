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
    
    private var player = SKSpriteNode(imageNamed: "idle000")
    @Binding var direction: Int
    init(direction:Binding<Int>, size:CGSize){
        _direction = direction
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView){
        setUpScene()
        setUpPlayer()
    }
    
    //sets up scene for landscape device
    private func setUpScene(){
        self.backgroundColor = .clear
        view?.allowsTransparency = true
        size = CGSize(width: 800, height: 300)
    }
    
    override func update(_ currentTime: TimeInterval){
        if direction == 1 {
            player.xScale = 0.20
            //runAnimation()
        }
        else if direction == -1 {
            player.xScale = -0.20
            //runAnimation()
        }
    }
    
    //sets up player
    private func setUpPlayer(){
        player.position = CGPoint(x:100 ,y: 100)
        player.setScale(0.2)
        idleAnimation()
        addChild(player)
    }
    
    private func idleAnimation(){
        let textureAtlas = SKTextureAtlas(named: "MasonIdle")
        var playerAnimation = [SKTexture]()
        for i in 0..<textureAtlas.textureNames.count {
            let name = "idle00\(i)"
            playerAnimation.append(textureAtlas.textureNamed(name))
        }
        let animation = SKAction.animate(with: playerAnimation, timePerFrame: 0.3)
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
