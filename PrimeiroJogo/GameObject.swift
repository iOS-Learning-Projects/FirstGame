//
//  GameObject.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import SpriteKit

enum CharacterState: String {
    case walk = "walking"
    case idle = "idle"
    case jump = "jumping"
    case hit = "hitting"
    case dead = "dead"
}

protocol GameObject {
    var inverted: Bool { get set }
    var onGround: Bool { get set }
    var characterState: CharacterState { get set }

    func setupPhysicsBody(objectSize: CGSize) -> SKPhysicsBody
}

extension GameObject {
    func setupPhysicsBody(objectSize: CGSize) -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOf: objectSize)

        return physicsBody
    }
}

protocol GameObjectDelegate {
    func didBeginContact(with node: SKNode, contact: SKPhysicsContact)
    func didEndContact(with node: SKNode, contact: SKPhysicsContact)
}

enum PhysicsCategory: UInt32 {
    case None = 0, Player, Enemy, Floor
}
