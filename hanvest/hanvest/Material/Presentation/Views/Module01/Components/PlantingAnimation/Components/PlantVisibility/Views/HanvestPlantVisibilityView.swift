//
//  PlantVisibilityView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantVisibilityView: View {
    @StateObject private var viewModel = HanvestPlantVisibilityViewModel()
    @Binding var growthProgress: PlantGrowthProgress
    
    var body: some View {
        ZStack {
            ZStack {
                HStack {
                    Image(viewModel.plantImage)
                        .transition(.opacity)
                        .id(viewModel.plantImage)
                }
                .padding(.leading, viewModel.customPaddingLeading(
                    defaultPaddingLeading: (growthProgress == .progress13) ? 52.0 : 38.5)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, viewModel.customPaddingBottom(
                defaultPaddingBottom: (growthProgress == .progress13) ?  87.0 : 228.0)
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .onChange(of: growthProgress) { _, newValue in
                viewModel.updateCurrentPlantImage(growthProgress: newValue)
            }
        }
        .allowsHitTesting(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }

}

#Preview {
    HanvestPlantVisibilityView(growthProgress: .constant(.progress01))
}
