//
//  Module01SoilSpriteEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import Foundation
import SpriteKit

class BasicInvestmentModuleSoilSprite: SKNode {
    private let image: SKSpriteNode = SKSpriteNode(imageNamed: "soil")
    
    override init() {
        super.init()
        
        self.setScale(1)
        self.zPosition = 3
        
        if UIScreen.main.bounds.width < 385 { // iPhone SE
            self.position = CGPoint(x: UIScreen.main.bounds.width / 1.9, y: UIScreen.main.bounds.width / 11)
        } else { // default iPhone
            self.position = CGPoint(x: UIScreen.main.bounds.width / 1.99, y: UIScreen.main.bounds.width / 2.25)
        }
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "soil"), size: CGSize(width: self.image.size.width, height: self.image.size.height))
        self.physicsBody?.categoryBitMask = BasicInvestmentModuleSpriteCollisionTypes.soil.rawValue
        self.physicsBody?.contactTestBitMask = BasicInvestmentModuleSpriteCollisionTypes.waterDroplets.rawValue
        self.physicsBody?.isDynamic = false
        
        self.addChild(image)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
