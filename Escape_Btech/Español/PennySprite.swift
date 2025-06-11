//
//  PennySprite.swift
//  Escape_Btech
//
//  Created by Student on 6/11/25.
//

import Foundation
import SwiftUI
import SpriteKit

class PennySprite: SKScene{
    private var penny = SKSpriteNode(imageNamed: "penny000")
    
    override func didMove(to view: SKView){
        setUpScene()
        setUpPenny()
    }
    
    private func setUpScene(){
        self.backgroundColor = .clear
        view?.allowsTransparency = true
        size = CGSize(width: 800, height: 300)
    }
    
    private func setUpPenny(){
        penny.position = CGPoint(x:600 ,y: 92)
        penny.setScale(0.21)
        idleAnimation()
        addChild(penny)
    }
    
    private func idleAnimation(){
        let textureAtlas = SKTextureAtlas(named: "pennyIdle")
        var playerAnimation = [SKTexture]()
        for i in 0..<textureAtlas.textureNames.count {
            let name = "penny00\(i)"
            playerAnimation.append(textureAtlas.textureNamed(name))
        }
        let animation = SKAction.animate(with: playerAnimation, timePerFrame: 0.5)
        let repeatForever = SKAction.repeatForever(animation)
        penny.run(repeatForever)
    }
}
