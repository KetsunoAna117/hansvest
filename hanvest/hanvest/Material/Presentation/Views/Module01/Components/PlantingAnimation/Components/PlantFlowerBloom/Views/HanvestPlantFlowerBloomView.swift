//
//  PlantFlowerBloomView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantFlowerBloomView: View {
    @StateObject private var viewModel = HanvestPlantFlowerBloomViewModel()
    @Binding var growthProgress: PlantGrowthProgress
    
    var onCompletion: (() -> Void)?
    
    var body: some View {
        ZStack {
            ForEach(viewModel.visibleFlowers.indices, id: \.self) { index in
                ZStack {
                    HStack {
                        viewModel.displayedImages[index].image
                    }
                    .padding(.leading, viewModel.customPaddingLeading(
                        defaultPaddingLeading: viewModel.displayedImages[index].leadingPadding)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, viewModel.customPaddingTop(
                    defaultPaddingTop: viewModel.displayedImages[index].topPadding)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
    HanvestPlantFlowerBloomView(growthProgress: .constant(.progress01))
}
