//
//  Friend.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 13/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import SpriteKit

class Friend: SKSpriteNode, GameObject {
    var inverted: Bool
    var onGround: Bool
    var characterState: CharacterState

    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: "Jelly1")
        self.inverted = false
        self.onGround = true
        self.characterState = .idle

        super.init(texture: texture, color: .clear, size: texture.size())

        self.position = position
        self.texture?.filteringMode = .nearest
        self.physicsBody = self.setupPhysicsBody(objectSize: self.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func animateFriend(timePerFrame: TimeInterval) {
        var textures = [SKTexture]()

        for i in 1...10 {
            let texture = SKTexture(imageNamed: "Jelly\(i)")
            texture.filteringMode = .nearest
            textures.append(texture)
        }

        let animateAction = SKAction.animate(with: textures, timePerFrame: timePerFrame)
        let repeatForeverAction = SKAction.repeatForever(animateAction)

        self.run(repeatForeverAction)
    }
}
