//
//  BasicInvestmentPositionOffset.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/11/24.
//

import Foundation

enum BasicInvestmentPositionOffset {
    case plant
    case flowerAndApple
    case appleBasket
    
    var offset: CGPoint {
        switch self {
            case .plant: return CGPoint(x: 10, y: 255)
            case .flowerAndApple: return CGPoint(x: 90, y: 205)
            case .appleBasket: return CGPoint(x: 0, y: 130)
        }
    }
}
