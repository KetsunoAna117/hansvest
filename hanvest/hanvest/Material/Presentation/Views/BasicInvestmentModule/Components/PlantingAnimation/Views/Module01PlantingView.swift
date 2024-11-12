//
//  Module01SpriteView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI
import SpriteKit

struct Module01PlantingView: View {
    @StateObject private var viewModel = Module01PlantingViewModel()
    @ObservedObject var highlightViewModel: HighlightViewModel
    
    var onCompletion: (() -> Void)?
    
    var body: some View {
        VStack {
            ZStack {
                if let spriteScene = viewModel.spriteScene {
                    SpriteView(scene: spriteScene)
                        .onAppear {
                            viewModel.startGrowthTimer()
                        }
                        .onChange(of: viewModel.growthProgress) { _, newValue in
                            if newValue == .progress08 {
                                viewModel.startGrowthTimer()
                            }
                        }
                }
                
                ZStack {
                    Text("\(viewModel.growthProgress.description)")
                        .font(.nunito(.title2))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .transition(.opacity)
                        .id(viewModel.growthProgress)
                }
                .padding(.top, (UIScreen.main.bounds.width < 385) ? 100 : 140)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                HanvestPlantVisibilityView(growthProgress: $viewModel.growthProgress)
                
                if viewModel.checkEligibilityPlantFlowerBloom() {
                    HanvestPlantFlowerBloomView(
                        growthProgress: $viewModel.growthProgress
                    ) {
                        viewModel.getNextGrowthProgress()
                        
                        viewModel.checkIfReturnToMainView(
                            completion: onCompletion
                        )
                    }
                }
                
                if viewModel.highlightWaterCanPosition != .zero {
                    Image("water-can-default")
                        .opacity(0)
                        .showCase(
                            order: Module01TipData.waterCan.index,
                            title: Module01TipData.waterCan.title,
                            detail: Module01TipData.waterCan.detail,
                            stage: Module01HighlightStage.waterCanStage.stringValue
                        )
                        .position(
                            CGPoint(
                                x: viewModel.highlightWaterCanPosition.x,
                                y: UIScreen.main.bounds.height - viewModel.highlightWaterCanPosition.y
                            )
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                                highlightViewModel.stage = Module01HighlightStage.waterCanStage.stringValue
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .onAppear {
                let scene = Module01SpriteController(
                    size: UIScreen.main.bounds.size,
                    growthProgress: $viewModel.growthProgress,
                    waterCanPosition: $viewModel.highlightWaterCanPosition
                )
                
                scene.scaleMode = .resizeFill
                viewModel.spriteScene = scene
            }
        }
    }
    
}

#Preview {
    Module01PlantingView(highlightViewModel: HighlightViewModel())
}
