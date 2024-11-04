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
                .padding(.leading, customPaddingLeading(defaultPaddingLeading: (growthProgress == .progress13) ? 52.0 : 46.5))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, customPaddingTop(defaultPaddingTop: (growthProgress == .progress13) ?  314.0 : 226.0))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
        if UIScreen.main.bounds.width < 375 {
            return (defaultPaddingLeading - 5)
        } else {
            return defaultPaddingLeading
        }
    }
    
    private func customPaddingTop(defaultPaddingTop: CGFloat) -> CGFloat {
        if UIScreen.main.bounds.width < 375 {
            return (defaultPaddingTop - 46)
        } else {
            return defaultPaddingTop
        }
    }
}

#Preview {
    HanvestPlantVisibilityView(growthProgress: .constant(.progress01))
}
