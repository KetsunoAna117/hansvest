//
//  Module01PlantGrowthProgress.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import SwiftUI

enum PlantGrowthProgress: Int {
    case progress01 = 1
    case progress02 = 2
    case progress03 = 3
    case progress04 = 4
    case progress05 = 5
    case progress06 = 6
    case progress07 = 7
    case progress08 = 8
    case progress09 = 9
    case progress10 = 10
    case progress11 = 11
    case progress12 = 12
    case progress13 = 13
    
    var description: String {
        switch self {
            case .progress01:
                "Investing stocks is similar to growing a plant"
            case .progress02:
                "Lets plant a tree"
            case .progress03:
                "Give water to the plant"
            case .progress04:
                "Give water to the plant"
            case .progress05:
                "Giving water can be interpreted as adding number of shares"
            case .progress06:
                "add little by little"
            case .progress07:
                "it will keep growing"
            case .progress08:
                "Lets watch the tree grow"
            case .progress09:
                "With a good care the tree will keep growing"
            case .progress10:
                "Then the flower will bloom"
            case .progress11:
                "Till the fruit came out one by one"
            case .progress12:
                "Then we can enjoy the result"
            case .progress13:
                "The fruit can be the interpretation as the profit that we get"
        }
    }
    
    var plantGrowthImage: (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)? {
        switch self {
            case .progress01, .progress02, .progress03:
                return nil
            case .progress04:
                return (Image("plant-growth-1"), 582, 190)
            case .progress05:
                return (Image("plant-growth-2"), 550, 172)
            case .progress06:
                return (Image("plant-growth-3"), 505, 155)
            case .progress07:
                return (Image("plant-growth-4"), 418, 148)
            case .progress08:
                return (Image("plant-growth-5"), 344, 96)
            case .progress09, .progress10, .progress11, .progress12:
                return (Image("plant-growth-6"), 289, 52)
            case .progress13:
                return (Image("plant-growth-7"), 314, 52)
        }
    }
    
    func nextProgress() -> PlantGrowthProgress? {
        return PlantGrowthProgress(rawValue: self.rawValue + 1)
    }
}
