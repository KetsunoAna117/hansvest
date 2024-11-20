//
//  PlantVisibilityView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct BasicInvestmentModulePlantVisibilityView: View {
    @StateObject private var viewModel = BasicInvestmentModulePlantVisibilityViewModel()
    @Binding var growthProgress: BasicInvestmentModulePlantGrowthProgress
    
    var body: some View {
        ZStack {
            Image(viewModel.plantImage)
                .transition(.opacity)
                .id(viewModel.plantImage)
        }
        .onChange(of: growthProgress) { _, newValue in
            viewModel.updateCurrentPlantImage(growthProgress: newValue)
        }
        .allowsHitTesting(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }

}

#Preview {
    @Previewable @State var growthProgress: BasicInvestmentModulePlantGrowthProgress = .progress01
    
    BasicInvestmentModulePlantVisibilityView(growthProgress: $growthProgress)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                withAnimation(.easeInOut) {
                    if let nextProgress = growthProgress.nextProgress() {
                        growthProgress = nextProgress
                    } else {
                        timer.invalidate()
                    }
                }
            }
        }
}
