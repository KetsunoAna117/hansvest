//
//  Module01FlowerBloomImage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

enum FlowerBloomImage: CaseIterable {
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
    case rightFlower01
    case rightFlower02
    case rightFlower03
    case rightFlower04
    case rightFlower05
    case rightFlower06
    case rightFlower07
    case rightFlower08
    
    var flowerImage: (image: Image, topPadding: CGFloat, leadingPadding: CGFloat) {
        switch self {
            case .leftFlower01:
                (Image("flower-left-01"), 464.78, 102.04)
            case .leftFlower02:
                (Image("flower-left-02"), 435.64, 92.39)
            case .leftFlower03:
                (Image("flower-left-03"), 427.72, 157.24)
            case .leftFlower04:
                (Image("flower-left-04"), 406.22, 131.81)
            case .leftFlower05:
                (Image("flower-left-05"), 397.17, 82.29)
            case .leftFlower06:
                (Image("flower-left-06"), 374.26, 159.86)
            case .leftFlower07:
                (Image("flower-left-07"), 353.52, 121.58)
            case .leftFlower08:
                (Image("flower-left-08"), 323.8, 135.03)
            case .leftFlower09:
                (Image("flower-left-09"), 318.9, 172.64)
            case .leftFlower10:
                (Image("flower-left-10"), 359.77, 190.34)
            case .rightFlower01:
                (Image("flower-right-01"), 469.65, 266.98)
            case .rightFlower02:
                (Image("flower-right-02"), 444.89, 289.34)
            case .rightFlower03:
                (Image("flower-right-03"), 433.72, 316.42)
            case .rightFlower04:
                (Image("flower-right-04"), 417.48, 280.62)
            case .rightFlower05:
                (Image("flower-right-05"), 404.25, 229.11)
            case .rightFlower06:
                (Image("flower-right-06"), 379.32, 286.45)
            case .rightFlower07:
                (Image("flower-right-07"), 378.43, 251)
            case .rightFlower08:
                (Image("flower-right-08"), 337.19, 249.27)
        }
    }
    
    var halfAppleImage: (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)?  {
        switch self {
            case .leftFlower01:
                (Image("apple-left-01"), 472.02, 97.75)
            case .leftFlower02:
                (Image("flower-left-02"), 435.64, 92.39)
            case .leftFlower03:
                (Image("apple-left-03"), 434.07, 151.3)
            case .leftFlower04:
                (Image("apple-left-04"), 406.65, 125.21)
            case .leftFlower05:
                (Image("apple-left-05"), 402.77, 78.38)
            case .leftFlower06:
                (Image("flower-left-06"), 374.26, 159.86)
            case .leftFlower07:
                (Image("apple-left-07"), 360.8, 119.47)
            case .leftFlower08:
                (Image("flower-left-08"), 323.8, 135.03)
            case .leftFlower09:
                (Image("flower-left-09"), 318.9, 172.64)
            case .leftFlower10:
                (Image("apple-left-10"), 357.47, 199.08)
            case .rightFlower01:
                (Image("flower-right-01"), 469.65, 266.98)
            case .rightFlower02:
                (Image("apple-right-02"), 452.41, 288.54)
            case .rightFlower03:
                (Image("apple-right-03"), 436.31, 308.97)
            case .rightFlower04:
                (Image("apple-right-04"), 420.49, 272.91)
            case .rightFlower05:
                (Image("flower-right-05"), 404.25, 229.11)
            case .rightFlower06:
                (Image("flower-right-06"), 379.32, 286.45)
            case .rightFlower07:
                (Image("apple-right-07"), 382.85, 245.09)
            case .rightFlower08:
                (Image("apple-right-08"), 345.13, 245.42)
        }
    }
    
    var fullAppleImage: (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)?  {
        switch self {
            case .leftFlower01:
                (Image("apple-left-01"), 472.02, 97.75)
            case .leftFlower02:
                (Image("apple-left-02"), 435.36, 85.05)
            case .leftFlower03:
                (Image("apple-left-03"), 434.07, 151.3)
            case .leftFlower04:
                (Image("apple-left-04"), 406.65, 125.21)
            case .leftFlower05:
                (Image("apple-left-05"), 402.77, 78.38)
            case .leftFlower06:
                (Image("apple-left-06"), 376.85, 157.07)
            case .leftFlower07:
                (Image("apple-left-07"), 360.8, 119.47)
            case .leftFlower08:
                (Image("apple-left-08"), 320.11, 127.74)
            case .leftFlower09:
                (Image("apple-left-09"), 323.13, 171.23)
            case .leftFlower10:
                (Image("apple-left-10"), 357.47, 199.08)
            case .rightFlower01:
                (Image("apple-right-01"), 473.75, 265.97)
            case .rightFlower02:
                (Image("apple-right-02"), 452.41, 288.54)
            case .rightFlower03:
                (Image("apple-right-03"), 436.31, 308.97)
            case .rightFlower04:
                (Image("apple-right-04"), 420.49, 272.91)
            case .rightFlower05:
                (Image("apple-right-05"), 404.79, 224.91)
            case .rightFlower06:
                (Image("apple-right-06"), 381.93, 279.6)
            case .rightFlower07:
                (Image("apple-right-07"), 382.85, 245.09)
            case .rightFlower08:
                (Image("apple-right-08"), 345.13, 245.42)
        }
    }
}
