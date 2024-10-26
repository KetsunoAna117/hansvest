//
//  Module01SpriteView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI
import SpriteKit
import Combine

struct Module01PlantingView: View {
    @State private var growthProgress: PlantGrowthProgress = .progress01
    @State private var growthTimer: AnyCancellable?
    @State private var spriteScene: Module01SpriteController?
    
    var onCompletion: (() -> Void)?
    
    var body: some View {
        ZStack {
            if let spriteScene = self.spriteScene {
                SpriteView(scene: spriteScene)
                    .onAppear {
                        self.startGrowthTimer()
                    }
                    .onChange(of: self.growthProgress) { _, newValue in
                        if newValue == .progress08 {
                            self.startGrowthTimer()
                        }
                    }
            }
            
            ZStack {
                Text("\(self.growthProgress.description)")
                    .font(.nunito(.title2))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .transition(.opacity)
                    .id(self.growthProgress)
            }
            .padding(.top, (UIScreen.main.bounds.width < 400) ? 100 : 140)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            HanvestPlantVisibilityView(growthProgress: self.$growthProgress)
            
            if checkEligibilityPlantFlowerBloom() {
                HanvestPlantFlowerBloomView(growthProgress: self.$growthProgress) {
                    self.getNextGrowthProgress()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            let scene = Module01SpriteController(size: UIScreen.main.bounds.size, growthProgress: self.$growthProgress)
            scene.scaleMode = .resizeFill
            self.spriteScene = scene
        }
    }
    
    private func startGrowthTimer() {
        self.growthTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
            .sink { _ in
                self.handleGrowthTimerEvent()
            }
    }
    
    private func handleGrowthTimerEvent() {
        if (checkForPauseGrowthProgress()) {
            self.getNextGrowthProgress()
        } else {
            self.stopGrowthTimer()
        }
    }
    
    private func getNextGrowthProgress() {
        withAnimation(.easeInOut) {
            if let nextProgress = self.growthProgress.nextProgress() {
                self.growthProgress = nextProgress
                self.checkIfReturnToMainView()
            } else {
                if self.growthTimer != nil {
                    self.stopGrowthTimer()
                }
            }
        }
    }
    
    private func stopGrowthTimer() {
        self.growthTimer?.cancel()
    }
    
    private func resumeGrowthTimer() {
        startGrowthTimer()
    }
    
    private func checkForPauseGrowthProgress() -> Bool {
        let currentGrowthProgress = self.growthProgress.rawValue
        
        let waterCanSection = (3...7).contains(currentGrowthProgress)
        let plantFlowerBloomSection = (10...12).contains(currentGrowthProgress)
        
        return (!(waterCanSection || plantFlowerBloomSection))
    }
    
    private func checkEligibilityPlantFlowerBloom() -> Bool {
        let currentGrowthProgress = self.growthProgress.rawValue
        
        let conditionPlantFlowerBloomSection = (10...12).contains(currentGrowthProgress)
        
        return conditionPlantFlowerBloomSection
    }
    
    private func checkIfReturnToMainView() {
        let delayTimeBeforeReturnToMainView: TimeInterval = 5.0
        
        if self.growthProgress == .progress13 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTimeBeforeReturnToMainView) {
                self.onCompletion?()
            }
        }
    }
}

#Preview {
    Module01PlantingView()
}
