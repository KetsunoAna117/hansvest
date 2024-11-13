//
//  PlantFlowerBloomView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct BasicInvestmentModulePlantFlowerBloomView: View {
    @StateObject private var viewModel = BasicInvestmentModulePlantFlowerBloomViewModel()
    @Binding var growthProgress: BasicInvestmentModulePlantGrowthProgress
    
    var onCompletion: (() -> Void)?
    
    var body: some View {
        ZStack {
            ForEach(viewModel.visibleFlowers.indices, id: \.self) { index in
                viewModel.displayedImages[index].image
//                ZStack {
//                    viewModel.displayedImages[index].image
//                }
//                .padding(.bottom, viewModel.displayedImages[index].bottomPadding)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.addNextFlower()
        }
        .onChange(of: growthProgress) { _, newValue in
            if newValue == .progress11 {
                viewModel.replaceFlowersWithApple(with: \.halfAppleImage)
            } else if newValue == .progress12 {
                viewModel.replaceFlowersWithApple(with: \.fullAppleImage)
            }
        }
        .onChange(of: viewModel.isDoneShowing) { _, newValue in
            if newValue {
                viewModel.returnToMainView(
                    growthProgress: growthProgress,
                    completion: onCompletion
                )
            }
        }
    }

}

#Preview {
    BasicInvestmentModulePlantFlowerBloomView(growthProgress: .constant(.progress01))
        .position(CGPoint(x: 200, y: 500))
}
