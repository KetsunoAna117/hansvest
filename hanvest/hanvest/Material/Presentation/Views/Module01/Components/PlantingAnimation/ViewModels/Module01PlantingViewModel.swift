//
//  Module01PlantingViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 06/11/24.
//

import SwiftUI
import Combine

class Module01PlantingViewModel: ObservableObject {
    @Published var growthProgress: PlantGrowthProgress
    @Published var spriteScene: Module01SpriteController?
    @Published var growthTimer: AnyCancellable?
    
    init() {
        self.growthProgress = .progress01
    }
    
    func startGrowthTimer() {
        growthTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
            .sink { _ in
                self.handleGrowthTimerEvent()
            }
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
    
    func stopGrowthTimer() {
        self.growthTimer?.cancel()
    }
    
    func resumeGrowthTimer() {
        startGrowthTimer()
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
        let delayTimeBeforeReturnToMainView: TimeInterval = 5.0
        
        if growthProgress == .progress13 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTimeBeforeReturnToMainView) {
                completion?()
            }
        }
    }
    
}
