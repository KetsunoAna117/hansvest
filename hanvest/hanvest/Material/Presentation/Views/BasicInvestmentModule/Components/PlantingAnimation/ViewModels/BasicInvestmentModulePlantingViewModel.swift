//
//  Module01PlantingViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 06/11/24.
//

import SwiftUI
import Combine

class BasicInvestmentModulePlantingViewModel: ObservableObject {
    @Published var growthProgress: BasicInvestmentModulePlantGrowthProgress
    @Published var highlightWaterCanPosition: CGPoint
    @Published var soilPosition: CGPoint
    @Published var spriteScene: BasicInvestmentModuleSpriteController?
    @Published var growthTimer: AnyCancellable?
    
    init() {
        self.growthProgress = .progress01
        self.highlightWaterCanPosition = .zero
        self.soilPosition = .zero
        self.setupSpriteScene()
    }
    
    func setupSpriteScene() {
        let scene = BasicInvestmentModuleSpriteController(
            size: UIScreen.main.bounds.size,
            growthProgress: Binding(
                get: { self.growthProgress },
                set: { self.growthProgress = $0 }
            ),
            onWaterCanPositionDetermined: { position in
                self.highlightWaterCanPosition = position
            },
            onSoilPositionDetermined: { position in
                self.soilPosition = position
            }
        )
        
        scene.scaleMode = .resizeFill
        self.spriteScene = scene
    }
    
    func startGrowthTimer() {
        growthTimer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
            .sink { _ in
                self.handleGrowthTimerEvent()
            }
    }
    
    func stopGrowthTimer() {
        self.growthTimer?.cancel()
    }
    
    func handleGrowthTimerEvent() {
        if (checkForPauseGrowthProgress()) {
            getNextGrowthProgress()
        } else {
            stopGrowthTimer()
        }
    }
    
    func getNextGrowthProgress() {
        withAnimation(.easeInOut) {
            if let nextProgress = growthProgress.nextProgress() {
                growthProgress = nextProgress
            } else {
                if growthTimer != nil {
                    stopGrowthTimer()
                }
            }
        }
    }
    
    func checkForPauseGrowthProgress() -> Bool {
        let currentGrowthProgress = growthProgress.rawValue
        
        let waterCanSection = (3...7).contains(currentGrowthProgress)
        let plantFlowerBloomSection = (10...12).contains(currentGrowthProgress)
        
        return (!(waterCanSection || plantFlowerBloomSection))
    }
    
    func checkEligibilityPlantFlowerBloom() -> Bool {
        let currentGrowthProgress = growthProgress.rawValue
        
        let conditionPlantFlowerBloomSection = (10...12).contains(currentGrowthProgress)
        
        return conditionPlantFlowerBloomSection
    }
    
    func checkIfReturnToMainView(completion: (() -> Void)?){
        let delayTimeBeforeReturnToMainView: TimeInterval = 3.0
        
        if growthProgress == .progress13 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTimeBeforeReturnToMainView) {
                completion?()
            }
        }
    }
    
    func adjustPositionFromSpriteKitToSwiftUI(adjustPositionBy: CGPoint = .zero) -> CGPoint {
        let spritePosition = (adjustPositionBy == .zero) ? self.highlightWaterCanPosition : self.soilPosition
        
        return CGPoint(
            x: spritePosition.x - adjustPositionBy.x,
            y: UIScreen.main.bounds.height - (spritePosition.y + adjustPositionBy.y)
        )
    }
    
}
