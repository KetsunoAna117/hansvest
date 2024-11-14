//
//  Module01FlowerBloomImage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

enum BasicInvestmentModuleFlowerBloomImage: CaseIterable {
    case leftFlower01
    case leftFlower02
    case leftFlower03
    case leftFlower04
    case leftFlower05
    case leftFlower06
    case leftFlower07
    case leftFlower08
    case leftFlower09
    case leftFlower10
//    case rightFlower01
//    case rightFlower02
//    case rightFlower03
//    case rightFlower04
//    case rightFlower05
//    case rightFlower06
//    case rightFlower07
//    case rightFlower08
    
    var flowerImage: (image: Image, bottomPadding: CGFloat, leadingPadding: CGFloat) {
        switch self {
            case .leftFlower01:
                (Image("flower-left-01"), 0, 0)
            case .leftFlower02:
                (Image("flower-left-02"), 70, -20)
            case .leftFlower03:
                (Image("flower-left-03"), 85, 88)
            case .leftFlower04:
                (Image("flower-left-04"), 130, 40)
            case .leftFlower05:
                (Image("flower-left-05"), 140, -35)
            case .leftFlower06:
                (Image("flower-left-06"), 185, 100)
            case .leftFlower07:
                (Image("flower-left-07"), 231, 19)
            case .leftFlower08:
                (Image("flower-left-08"), 300, 47)
            case .leftFlower09:
                (Image("flower-left-09"), 293, 130)
            case .leftFlower10:
                (Image("flower-left-10"), 226, 153)
//            case .rightFlower01:
//                (Image("flower-right-01"), -14.15, 153.55)
//            case .rightFlower02:
//                (Image("flower-right-02"), 395.76, 281.34)
//            case .rightFlower03:
//                (Image("flower-right-03"), 410.51, 308.42)
//            case .rightFlower04:
//                (Image("flower-right-04"), 426.73, 272.62)
//            case .rightFlower05:
//                (Image("flower-right-05"), 436.14, 221.11)
//            case .rightFlower06:
//                (Image("flower-right-06"), 453.69, 278.45)
//            case .rightFlower07:
//                (Image("flower-right-07"), 461.96, 243)
//            case .rightFlower08:
//                (Image("flower-right-08"), 500.89, 241.27)
        }
    }
    
    var halfAppleImage: (image: Image, bottomPadding: CGFloat, leadingPadding: CGFloat)?  {
        switch self {
            case .leftFlower01:
                (Image("apple-left-01"), 0, 0)
            case .leftFlower02:
            (Image("flower-left-02"), 70, -20)
            case .leftFlower03:
                (Image("apple-left-03"), 85, 88)
            case .leftFlower04:
                (Image("apple-left-04"), 130, 40)
            case .leftFlower05:
                (Image("apple-left-05"), 140, -35)
            case .leftFlower06:
                (Image("flower-left-06"), 185, 100)
            case .leftFlower07:
                (Image("apple-left-07"), 231, 19)
            case .leftFlower08:
                (Image("flower-left-08"), 300, 47)
            case .leftFlower09:
                (Image("flower-left-09"), 293, 130)
            case .leftFlower10:
                (Image("apple-left-10"), 226, 153)
//            case .rightFlower01:
//                (Image("flower-right-01"), -8.23, 147.97)
//            case .rightFlower02:
//                (Image("apple-right-02"), 394.11, 280.54)
//            case .rightFlower03:
//                (Image("apple-right-03"), 403.62, 300.97)
//            case .rightFlower04:
//                (Image("apple-right-04"), 419.45, 264.91)
//            case .rightFlower05:
//                (Image("flower-right-05"), 436.14, 221.11)
//            case .rightFlower06:
//                (Image("flower-right-06"), 453.69, 278.45)
//            case .rightFlower07:
//                (Image("apple-right-07"), 457.08, 237.09)
//            case .rightFlower08:
//                (Image("apple-right-08"), 498.52, 237.42)
        }
    }
    
    var fullAppleImage: (image: Image, bottomPadding: CGFloat, leadingPadding: CGFloat)?  {
        switch self {
            case .leftFlower01:
                (Image("apple-left-01"), 0, 0)
            case .leftFlower02:
            (Image("apple-left-02"), 70, -20)
            case .leftFlower03:
                (Image("apple-left-03"), 85, 88)
            case .leftFlower04:
                (Image("apple-left-04"), 130, 40)
            case .leftFlower05:
                (Image("apple-left-05"), 140, -35)
            case .leftFlower06:
                (Image("apple-left-06"), 185, 100)
            case .leftFlower07:
                (Image("apple-left-07"), 231, 19)
            case .leftFlower08:
                (Image("apple-left-08"), 300, 47)
            case .leftFlower09:
                (Image("apple-left-09"), 293, 130)
            case .leftFlower10:
                (Image("apple-left-10"), 226, 153)
//            case .rightFlower01:
//                (Image("apple-right-01"), -8.23, 147.97)
//            case .rightFlower02:
//                (Image("apple-right-02"), 394.11, 280.54)
//            case .rightFlower03:
//                (Image("apple-right-03"), 403.62, 300.97)
//            case .rightFlower04:
//                (Image("apple-right-04"), 419.45, 264.91)
//            case .rightFlower05:
//                (Image("apple-right-05"), 432.64, 216.91)
//            case .rightFlower06:
//                (Image("apple-right-06"), 457.13, 271.6)
//            case .rightFlower07:
//                (Image("apple-right-07"), 457.08, 237.09)
//            case .rightFlower08:
//                (Image("apple-right-08"), 498.52, 237.42)
        }
    }
}
