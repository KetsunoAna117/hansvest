//
//  Module01WaterDropletsSpriteEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import Foundation
import SpriteKit

class BasicInvestmentModuleWaterDropletSprite: SKNode {
    private let image: SKSpriteNode = SKSpriteNode(imageNamed: "water-droplet")
    
    init(position: CGPoint) {
        super.init()
        
        self.setScale(1)
        self.zPosition = 1
        self.position = position
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "water-droplet"), size: CGSize(width: self.image.size.width, height: self.image.size.height))
        self.physicsBody?.categoryBitMask = BasicInvestmentModuleSpriteCollisionTypes.waterDroplets.rawValue
        self.physicsBody?.contactTestBitMask = BasicInvestmentModuleSpriteCollisionTypes.soil.rawValue
        self.physicsBody?.collisionBitMask = 0
        
        self.physicsBody?.linearDamping = 1 //adjust how fast an object falls
//        self.physicsBody?.restitution = 2 //adjust how bouncy an object is
        
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
