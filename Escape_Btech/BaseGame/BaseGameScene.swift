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
    private var anim = 0
    @Binding var direction: Int
    @Binding var playerPos: CGFloat
    init(direction:Binding<Int>, playerPos:Binding<CGFloat>, size:CGSize){
        _direction = direction
        _playerPos = playerPos
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
            if anim == 0 {
                walkAnimation()
                anim += 1
            }
        }
        else if direction == -1 {
            player.xScale = -0.20
            if anim == 0 {
                walkAnimation()
                anim += 1
            }
        }
        if direction == 0 {
            if anim != 0 {
                idleAnimation()
                anim = 0
            }
        }
        if playerPos < -450 && direction == 1 && player.position.x < 380{
            player.position.x += 5
        }
        else if direction == -1 && player.position.x > 100 {
            player.position.x -= 5
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
    
    private func walkAnimation(){
        let textureAtlas = SKTextureAtlas(named: "MasonWalk")
        var playerAnimation = [SKTexture]()
        for i in 0..<textureAtlas.textureNames.count {
            let name = "walk00\(i)"
            playerAnimation.append(textureAtlas.textureNamed(name))
        }
        let animation = SKAction.animate(with: playerAnimation, timePerFrame: 0.15)
        let repeatForever = SKAction.repeatForever(animation)
        player.run(repeatForever)
    }
    
}
