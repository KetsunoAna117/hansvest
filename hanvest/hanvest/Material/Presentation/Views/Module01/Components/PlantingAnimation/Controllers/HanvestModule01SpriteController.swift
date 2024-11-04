//
//  Module01SpriteController.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import SwiftUI
import SpriteKit

class Module01SpriteController: SKScene, SKPhysicsContactDelegate {
    // Sprites
    private let soil: Soil
    private var waterCan: WaterCan
    
    // Variables
    private var draggingBehavior: draggingBehavior
    private var lastUpdatedTime : TimeInterval
    private var currentWaterDropletSpawnTime : TimeInterval
    private var waterDropletSpawnRate : TimeInterval
    private var spriteContactCounter: Int
    @Binding var growthProgress: PlantGrowthProgress
    
    init(size: CGSize, growthProgress: Binding<PlantGrowthProgress>) {
        self.soil = Soil()
        self.waterCan = WaterCan()
        self.draggingBehavior = .isNotDragging
        self.lastUpdatedTime = 0
        self.currentWaterDropletSpawnTime = 0
        self.waterDropletSpawnRate = 0.01
        self.spriteContactCounter = 0
        self._growthProgress = growthProgress
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .background
        self.size = view.frame.size
        self.physicsWorld.contactDelegate = self
        self.addChild(soil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchPoint = touches.first?.location(in: self) {
            
            // Check if the touch point is within the waterCan's frame
            if self.waterCan.contains(touchPoint) {
                self.waterCan.setDestination(destination: touchPoint)
                self.waterCan.tiltBy(degrees: -37.45)
                self.draggingBehavior = .isDragging
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.draggingBehavior == .isDragging, let touchPoint = touches.first?.location(in: self) {
            
            // Update the waterCan position only if dragging is in progress
            self.waterCan.setDestination(destination: touchPoint)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.draggingBehavior == .isDragging {
            self.waterCan.resetTilt()
            self.waterCan.bounceBackToInitialPosition()
            self.draggingBehavior = .isNotDragging
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        handleGrowthProgress()
        
        if (self.draggingBehavior == .isDragging) && (waterCan.parent != nil) {
            if (self.lastUpdatedTime == 0) {
                self.lastUpdatedTime = currentTime
            }
            
            // Calculate time since last update
            let dt = currentTime - self.lastUpdatedTime
            
            // Update the Spawn Timer
            self.currentWaterDropletSpawnTime += dt
            
            let currPosition = self.waterCan.update(deltaTime: dt)
            
            if self.currentWaterDropletSpawnTime > self.waterDropletSpawnRate {
                self.currentWaterDropletSpawnTime = 0
                
                self.createWaterDroplet(position: currPosition)
            }
            
            self.lastUpdatedTime = currentTime
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == SpriteCollisionTypes.waterDroplets.rawValue) && (contact.bodyB.categoryBitMask == SpriteCollisionTypes.soil.rawValue) {
            handleContactBetweenWaterDropletAndSoil(contact, contact.bodyA)
        } else if (contact.bodyA.categoryBitMask == SpriteCollisionTypes.soil.rawValue) && (contact.bodyB.categoryBitMask == SpriteCollisionTypes.waterDroplets.rawValue) {
            handleContactBetweenWaterDropletAndSoil(contact, contact.bodyB)
        }
    }

    private func handleContactBetweenWaterDropletAndSoil(_ contact: SKPhysicsContact, _ droplet: SKPhysicsBody) {
        let move = SKAction.move(to: contact.contactPoint, duration: 0.1)
        let scale = SKAction.scale(to: 0.0001, duration: 0.1)
        let sequence = SKAction.sequence([move, scale])
        
        self.handlesSpriteContactCounterForGrowthProgress()
        
        droplet.node?.run(sequence)
        droplet.node?.physicsBody?.categoryBitMask = 0
    }
    
    private func handlesSpriteContactCounterForGrowthProgress() {
        self.spriteContactCounter += 1
        
        if spriteContactCounter % 300 == 0 {
            withAnimation(.easeInOut) {
                if let nextProgress = growthProgress.nextProgress() {
                    growthProgress = nextProgress
                }
            }
        }
    }
    
    private func createWaterDroplet(position: CGPoint) {
        let droplets = WaterDroplet(position: position)
        self.addChild(droplets)
    }
    
    private func handleGrowthProgress() {
        if growthProgress == .progress03 {
            if waterCan.parent == nil {
                waterCan.setScale(0.1)
                waterCan.alpha = 0

                self.addChild(waterCan)

                let fadeIn = SKAction.fadeIn(withDuration: 0.25)
                let scaleUp = SKAction.scale(to: 1.0, duration: 0.25)
                let group = SKAction.group([fadeIn, scaleUp])

                waterCan.run(group)
            }
        } else if growthProgress == .progress08 {
            waterCan.removeFromParent()
        } else if growthProgress == .progress13 {
            soil.removeFromParent()
        }
    }
}
