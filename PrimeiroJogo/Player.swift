//
//  Player.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode, GameObject {

    var characterState: CharacterState
    var inverted: Bool
    var onGround: Bool

    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: "Wolf1")
        self.characterState = CharacterState.idle
        self.inverted = false
        self.onGround = true

        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.setScale(4)
        self.texture?.filteringMode = .nearest
        
        self.physicsBody = self.setupPhysicsBody(objectSize: self.size)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    func setupPhysicsBody(objectSize: CGSize) -> SKPhysicsBody {
//        return SKPhysicsBody()
//    }

    func moveToPosition(_ position: CGPoint) {
        let positionLimitedInX = CGPoint(x: position.x, y: self.position.y)
        let xDistance = position.x - self.position.x

        if xDistance < 0 && self.inverted == false {
            self.inverted = true
            self.xScale = self.xScale * -1
        } else if xDistance > 0 && self.inverted == true {
            self.inverted = false
            self.xScale = self.xScale * -1
        }

        let moveAction = SKAction.move(to: positionLimitedInX, duration: 5)

        self.run(moveAction)
    }

    func disappear() {
        let fadeAction = SKAction.fadeAlpha(to: 0, duration: 5)
        self.run(fadeAction)
    }
}
