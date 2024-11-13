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
    
//    func customPaddingLeading(defaultPaddingLeading: CGFloat) -> CGFloat {
//        switch UIScreen.main.bounds.width {
//            case ..<385:
//                return (defaultPaddingLeading + 3)
//            case 385..<410:
//                return defaultPaddingLeading
//            default:
//                return (defaultPaddingLeading + 23)
//        }
//    }
//
//    func customPaddingBottom(defaultPaddingBottom: CGFloat) -> CGFloat {
//        switch UIScreen.main.bounds.width {
//            case ..<385:
//                return (defaultPaddingBottom - 140)
//            case 385..<410:
//                return defaultPaddingBottom
//            default:
//                return (defaultPaddingBottom + 20)
//        }
//    }
    
}
