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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPhysicsBody(objectSize: CGSize) -> SKPhysicsBody {
        return SKPhysicsBody()
    }
}
