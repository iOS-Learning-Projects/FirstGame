//
//  GameScene.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let gameLayer: GameLayer?
    let hudLayer: HUDLayer?
    let backgroundLayer: BackgroundLayer?

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        self.addChild(self.gameLayer!)
        self.addChild(self.hudLayer!)
        self.addChild(self.backgroundLayer!)
    }

    override init(size: CGSize) {
        self.gameLayer = GameLayer(sceneSize: size)
        self.hudLayer = HUDLayer(sceneSize: size)
        self.backgroundLayer = BackgroundLayer(sceneSize: size)

        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(codr:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
