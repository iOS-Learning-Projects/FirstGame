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
        self.player = Player(position: CGPoint(x: sceneSize.width / 2, y: sceneSize.height / 2))
        super.init()

        self.zPosition = 1
        self.addChild(self.player)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
