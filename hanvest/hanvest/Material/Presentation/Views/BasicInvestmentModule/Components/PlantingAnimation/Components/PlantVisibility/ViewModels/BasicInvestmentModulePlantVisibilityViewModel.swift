//
//  HanvestPlantVisibilityViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 06/11/24.
//

import SwiftUI

class BasicInvestmentModulePlantVisibilityViewModel: ObservableObject {
    @Published var plantImage: String
    
    init() {
        self.plantImage = ""
    }
    
    func updateCurrentPlantImage(growthProgress: BasicInvestmentModulePlantGrowthProgress) {
        withAnimation(.easeInOut) {
            if let matchedImage = BasicInvestmentModulePlantImage.allCases.first(where: { $0.rawValue == growthProgress.rawValue }) {
                plantImage = matchedImage.plantImageName
            }
        }
    }
    
}
