//
//  HUDLayer.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import SpriteKit

class HUDLayer: SKNode {

    init(sceneSize: CGSize) {
        super.init()

        self.createHUDLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createHUDLayer() {
        let timeCounterLabel = SKLabelNode(text: "10s")
        timeCounterLabel.position = CGPoint(x: 20, y: 100)


        self.addChild(timeCounterLabel)
    }
}
