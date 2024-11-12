//
//  Module01WaterCanSpriteEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import Foundation
import SpriteKit

class BasicInvestmentModuleWaterCanSprite: SKNode {
    private let image: SKSpriteNode = SKSpriteNode(imageNamed: "water-can-default")
    private let easing : CGFloat = 0.1
    private var destination : CGPoint?
    private var initialPosition: CGPoint?
    
    override init() {
        super.init()

        self.setScale(1)
        self.zPosition = 2
        
        if UIScreen.main.bounds.width < 385 {
            self.position = CGPoint(x: (UIScreen.main.bounds.width / 4.15), y: (UIScreen.main.bounds.width / 0.85))
        } else {
            self.position = CGPoint(x: (UIScreen.main.bounds.width / 4.15), y: (UIScreen.main.bounds.width / 0.691))
        }
        
        self.initialPosition = self.position
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "water-can-default"), size: CGSize(width: self.image.size.width, height: self.image.size.height))
        self.physicsBody?.categoryBitMask = BasicInvestmentModuleSpriteCollisionTypes.waterCan.rawValue
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.isDynamic = false
        
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updatePosition(point : CGPoint) {
        self.position = point
        self.destination = point
    }
    
    public func setDestination(destination : CGPoint) {
        self.destination = destination
    }
    
    public func update(deltaTime: TimeInterval) -> CGPoint {
        if let destination = self.destination {
            let distance = sqrt(pow((destination.x - position.x), 2) + pow((destination.y - position.y), 2))
            
            if (distance > 1) {
                let directionX = (destination.x - position.x)
                let directionY = (destination.y - position.y)
                
                position.x += directionX * self.easing
                position.y += directionY * self.easing
            } else {
                position = destination
            }
        }
        
        let waterCanMouthPosition = CGPoint(x: position.x + 70, y: position.y - 20)
        
        return waterCanMouthPosition
    }
    
    public func tiltBy(degrees: CGFloat) {
        let radians = degrees * CGFloat.pi / 180
        let tiltAction = SKAction.rotate(toAngle: radians, duration: 0.3, shortestUnitArc: true)
        self.run(tiltAction)
    }

    public func resetTilt() {
        let resetAction = SKAction.rotate(toAngle: 0, duration: 0.3, shortestUnitArc: true)
        self.run(resetAction)
    }
    
    public func bounceBackToInitialPosition() {
        if let initialPosition = self.initialPosition {
            let moveBackAction = SKAction.move(to: initialPosition, duration: 0.5)
            self.run(moveBackAction)
        }
    }
}
