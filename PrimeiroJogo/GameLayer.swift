//
//  GameLayer.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import SpriteKit

class GameLayer: SKNode {

    let player: Player!

    init(sceneSize: CGSize) {
        self.player = Player(position: CGPoint(x: sceneSize.width / 2, y: 40))
        super.init()

        self.isUserInteractionEnabled = true
        self.zPosition = 1
        self.addChild(self.player)

        self.friendGenerator(waitingTime: 0.5, sceneSize: sceneSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.player.removeAllActions()
//        self.player.moveToPosition((touches.first?.location(in: self))!)

        let touch = touches.first!
        let touchPosition = touch.location(in: self)

        if touchPosition.x > self.player.position.x {
            self.player.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 250))
        } else {
            self.player.physicsBody?.applyImpulse(CGVector(dx: -100, dy: 250))
        }
    }

    // MARK: - Friends Methods
    func createFriend(with position: CGPoint) {
        let friend = Friend(position: position)
        friend.animateFriend(timePerFrame: 0.05)
        self.addChild(friend)
    }

    func actionsExamples() {
        let colorizeAction = SKAction.colorize(with: .magenta, colorBlendFactor: 1, duration: 1)
        let normalizeAction = SKAction.colorize(withColorBlendFactor: 0, duration: 1)
        let sequence = SKAction.sequence([colorizeAction, normalizeAction])

        let blockAction = SKAction.run {
            print("Jump")
        }

        let waitAction = SKAction.wait(forDuration: 0.5)

        let moveUpAction = SKAction.moveBy(x: 0, y: 20, duration: 1)
        let moveDownAction = SKAction.moveBy(x: 0, y: -20, duration: 1)
        let moveSequence = SKAction.sequence([moveUpAction, waitAction, blockAction, moveDownAction])


        let groupSequence = SKAction.group([sequence, moveSequence])

        let repeatAction = SKAction.repeatForever(groupSequence)
        
        
        self.player.run(repeatAction)
    }

    func friendGenerator(waitingTime: TimeInterval, sceneSize: CGSize) {
        let wait = SKAction.wait(forDuration: waitingTime)
        let createFriendBlock = SKAction.run {
            let position = CGPoint(x: CGPoint.random(min: sceneSize.width * 0.05, max: sceneSize.width * 0.95), y: CGPoint.random(min: sceneSize.height * 0.5, max: sceneSize.height * 0.95))
            self.createFriend(with: position)
        }

        let sequence = SKAction.sequence([wait, createFriendBlock])
        let repeatForever = SKAction.repeatForever(sequence)

        self.run(repeatForever)
    }
}
