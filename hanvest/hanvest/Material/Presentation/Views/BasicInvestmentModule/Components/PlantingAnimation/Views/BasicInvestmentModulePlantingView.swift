//
//  Module01SpriteView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI
import SpriteKit

struct BasicInvestmentModulePlantingView: View {
    @StateObject private var viewModel = BasicInvestmentModulePlantingViewModel()
    @ObservedObject var highlightViewModel: HanvestHighlightViewModel
    
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
                
                BasicInvestmentModulePlantVisibilityView(growthProgress: $viewModel.growthProgress)
                
                if viewModel.checkEligibilityPlantFlowerBloom() {
                    BasicInvestmentModulePlantFlowerBloomView(
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
                            order: BasicInvestmentModuleTipData.waterCan.index,
                            title: BasicInvestmentModuleTipData.waterCan.title,
                            detail: BasicInvestmentModuleTipData.waterCan.detail,
                            stage: BasicInvestmentModuleHighlightStage.waterCanStage.stringValue
                        )
                        .position(
                            CGPoint(
                                x: viewModel.highlightWaterCanPosition.x,
                                y: UIScreen.main.bounds.height - viewModel.highlightWaterCanPosition.y
                            )
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                                highlightViewModel.stage = BasicInvestmentModuleHighlightStage.waterCanStage.stringValue
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .onAppear {
                let scene = BasicInvestmentModuleSpriteController(
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
    BasicInvestmentModulePlantingView(highlightViewModel: HanvestHighlightViewModel())
}
