//
//  BackgroundLayer.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import SpriteKit

class BackgroundLayer: SKNode {
//    var layers = [Background]()

    init(sceneSize: CGSize) {
        super.init()

        self.createBackgroundLayers(sceneSize: sceneSize)
        self.zPosition = -10
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createBackgroundLayers(sceneSize: CGSize) {

        for i in 1...9 {
            let snowBackground = Background(
                position: CGPoint(x: sceneSize.width / 2, y: sceneSize.height / 2),
                texture: SKTexture(imageNamed: "Snow_Layer_0\(i)"))

            snowBackground.zPosition = CGFloat(i)
            snowBackground.setScale(1.5)

//            self.layers.append(snowBackground)
            self.addChild(snowBackground)
        }
    }
}
