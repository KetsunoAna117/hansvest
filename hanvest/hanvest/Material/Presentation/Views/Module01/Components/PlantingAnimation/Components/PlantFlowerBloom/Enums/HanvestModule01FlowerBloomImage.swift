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
                (Image("flower-left-01"), 462.78, 94.04)
            case .leftFlower02:
                (Image("flower-left-02"), 433.64, 84.39)
            case .leftFlower03:
                (Image("flower-left-03"), 425.72, 149.24)
            case .leftFlower04:
                (Image("flower-left-04"), 404.22, 123.81)
            case .leftFlower05:
                (Image("flower-left-05"), 395.17, 74.29)
            case .leftFlower06:
                (Image("flower-left-06"), 372.26, 151.86)
            case .leftFlower07:
                (Image("flower-left-07"), 351.52, 113.58)
            case .leftFlower08:
                (Image("flower-left-08"), 321.8, 127.03)
            case .leftFlower09:
                (Image("flower-left-09"), 316.9, 164.64)
            case .leftFlower10:
                (Image("flower-left-10"), 357.77, 182.34)
            case .rightFlower01:
                (Image("flower-right-01"), 467.65, 258.98)
            case .rightFlower02:
                (Image("flower-right-02"), 442.89, 281.34)
            case .rightFlower03:
                (Image("flower-right-03"), 431.72, 308.42)
            case .rightFlower04:
                (Image("flower-right-04"), 415.48, 272.62)
            case .rightFlower05:
                (Image("flower-right-05"), 402.25, 221.11)
            case .rightFlower06:
                (Image("flower-right-06"), 377.32, 278.45)
            case .rightFlower07:
                (Image("flower-right-07"), 376.43, 243)
            case .rightFlower08:
                (Image("flower-right-08"), 335.19, 241.27)
        }
    }
    
    var halfAppleImage: (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)?  {
        switch self {
            case .leftFlower01:
                (Image("apple-left-01"), 470.02, 89.75)
            case .leftFlower02:
                (Image("flower-left-02"), 433.64, 84.39)
            case .leftFlower03:
                (Image("apple-left-03"), 432.07, 143.3)
            case .leftFlower04:
                (Image("apple-left-04"), 404.65, 117.21)
            case .leftFlower05:
                (Image("apple-left-05"), 398.77, 70.38)
            case .leftFlower06:
                (Image("flower-left-06"), 372.26, 151.86)
            case .leftFlower07:
                (Image("apple-left-07"), 358.8, 111.47)
            case .leftFlower08:
                (Image("flower-left-08"), 321.8, 127.03)
            case .leftFlower09:
                (Image("flower-left-09"), 316.9, 164.64)
            case .leftFlower10:
                (Image("apple-left-10"), 355.47, 191.08)
            case .rightFlower01:
                (Image("flower-right-01"), 467.65, 258.98)
            case .rightFlower02:
                (Image("apple-right-02"), 450.41, 280.54)
            case .rightFlower03:
                (Image("apple-right-03"), 434.31, 300.97)
            case .rightFlower04:
                (Image("apple-right-04"), 418.49, 264.91)
            case .rightFlower05:
                (Image("flower-right-05"), 402.25, 221.11)
            case .rightFlower06:
                (Image("flower-right-06"), 377.32, 278.45)
            case .rightFlower07:
                (Image("apple-right-07"), 380.85, 237.09)
            case .rightFlower08:
                (Image("apple-right-08"), 343.13, 237.42)
        }
    }
    
    var fullAppleImage: (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)?  {
        switch self {
            case .leftFlower01:
                (Image("apple-left-01"), 470.02, 89.75)
            case .leftFlower02:
                (Image("apple-left-02"), 433.36, 77.05)
            case .leftFlower03:
                (Image("apple-left-03"), 432.07, 143.3)
            case .leftFlower04:
                (Image("apple-left-04"), 404.65, 117.21)
            case .leftFlower05:
                (Image("apple-left-05"), 400.77, 70.38)
            case .leftFlower06:
                (Image("apple-left-06"), 374.85, 149.07)
            case .leftFlower07:
                (Image("apple-left-07"), 358.8, 111.47)
            case .leftFlower08:
                (Image("apple-left-08"), 318.11, 119.74)
            case .leftFlower09:
                (Image("apple-left-09"), 321.13, 163.23)
            case .leftFlower10:
                (Image("apple-left-10"), 355.47, 191.08)
            case .rightFlower01:
                (Image("apple-right-01"), 471.75, 257.97)
            case .rightFlower02:
                (Image("apple-right-02"), 450.41, 280.54)
            case .rightFlower03:
                (Image("apple-right-03"), 434.31, 300.97)
            case .rightFlower04:
                (Image("apple-right-04"), 418.49, 264.91)
            case .rightFlower05:
                (Image("apple-right-05"), 402.79, 216.91)
            case .rightFlower06:
                (Image("apple-right-06"), 379.93, 271.6)
            case .rightFlower07:
                (Image("apple-right-07"), 380.85, 237.09)
            case .rightFlower08:
                (Image("apple-right-08"), 343.13, 237.42)
        }
    }
}
