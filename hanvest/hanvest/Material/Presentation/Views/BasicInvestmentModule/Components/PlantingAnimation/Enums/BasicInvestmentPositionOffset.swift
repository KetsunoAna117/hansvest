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
    
    var offset: CGPoint {
        switch self {
            case .plant: return CGPoint(x: 10, y: 255)
            case .flowerAndApple: return CGPoint(x: 90, y: 205) //x naik maka makin kekiri, y naik malah makin naik
        }
    }
}
