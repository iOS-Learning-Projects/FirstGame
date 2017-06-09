//
//  Background.swift
//  PrimeiroJogo
//
//  Created by Eduardo Vital Alencar Cunha on 09/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import SpriteKit

class Background: SKSpriteNode {

    init(position: CGPoint, texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())

        self.position = position
        self.texture?.filteringMode = .nearest
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
