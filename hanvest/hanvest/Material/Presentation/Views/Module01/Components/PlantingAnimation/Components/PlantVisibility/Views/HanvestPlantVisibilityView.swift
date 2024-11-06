//
//  PlantVisibilityView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantVisibilityView: View {
    @State private var plantImage: String = ""
    @Binding var growthProgress: PlantGrowthProgress
    
    var body: some View {
        ZStack {
            ZStack {
                HStack {
                    Image(self.plantImage)
                        .transition(.opacity)
                        .id(self.plantImage)
                }
                .padding(.leading, customPaddingLeading(defaultPaddingLeading: (growthProgress == .progress13) ? 52.0 : 38.5))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, customPaddingBottom(defaultPaddingBottom: (growthProgress == .progress13) ?  87.0 : 228.0))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .onChange(of: self.growthProgress) { _, newValue in
                self.updateCurrentPlantImage(growthProgress: newValue)
            }
        }
        .allowsHitTesting(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    private func updateCurrentPlantImage(growthProgress: PlantGrowthProgress) {
        withAnimation(.easeInOut) {
            if let matchedImage = PlantImage.allCases.first(where: { $0.rawValue == growthProgress.rawValue }) {
                self.plantImage = matchedImage.plantImageName
            }
        }
    }
    
    private func customPaddingLeading(defaultPaddingLeading: CGFloat) -> CGFloat {
        if UIScreen.main.bounds.width < 385 {
            return (defaultPaddingLeading + 3)
        } else {
            return defaultPaddingLeading
        }
    }
    
    private func customPaddingBottom(defaultPaddingBottom: CGFloat) -> CGFloat {
        if UIScreen.main.bounds.width < 385 {
            return (defaultPaddingBottom - 140)
        } else {
            return defaultPaddingBottom
        }
    }
}

#Preview {
    HanvestPlantVisibilityView(growthProgress: .constant(.progress01))
}
