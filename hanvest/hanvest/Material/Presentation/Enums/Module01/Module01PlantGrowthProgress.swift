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
    
    var plantGrowthImageName: String? {
        switch self {
            case .progress01, .progress02, .progress03:
                nil
            case .progress04:
                "plant-growth-1"
            case .progress05:
                "plant-growth-2"
            case .progress06:
                "plant-growth-3"
            case .progress07:
                "plant-growth-4"
            case .progress08:
                "plant-growth-5"
            case .progress09, .progress10, .progress11, .progress12:
                "plant-growth-6"
            case .progress13:
                "plant-growth-7"
        }
    }
    
    func nextProgress() -> PlantGrowthProgress? {
        return PlantGrowthProgress(rawValue: self.rawValue + 1)
    }
}
