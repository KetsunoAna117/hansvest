//
//  HanvestModule01PlantImage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

enum BasicInvestmentModulePlantImage: Int, CaseIterable {
    case image01 = 4
    case image02 = 5
    case image03 = 6
    case image04 = 7
    case image05 = 8
    case image06 = 9
    case image07 = 13
    
    var plantImageName: String {
        switch self {
            case .image01:
                "plant-growth-1"
            case .image02:
                "plant-growth-2"
            case .image03:
                "plant-growth-3"
            case .image04:
                "plant-growth-4"
            case .image05:
                "plant-growth-5"
            case .image06:
                "plant-growth-6"
            case .image07:
                "plant-growth-7"
        }
    }
    
    func nextImage() -> BasicInvestmentModulePlantImage {
        let allCases = BasicInvestmentModulePlantImage.allCases
        
        if let currentIndex = allCases.firstIndex(of: self) {
            let nextIndex = currentIndex + 1
            if nextIndex < allCases.count {
                return allCases[nextIndex]
            }
        }
        
        return self
    }
}
