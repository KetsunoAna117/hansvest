//
//  HanvestPlantFlowerBloomViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 06/11/24.
//

import SwiftUI

class HanvestPlantFlowerBloomViewModel: ObservableObject {
    let normalTimeToChangePage: CGFloat
    let flowerAndAppleAppearTime: CGFloat
    let allFlowers: [FlowerBloomImage]
    
    @Published var visibleFlowers: [FlowerBloomImage]
    @Published var displayedImages: [(image: Image, topPadding: CGFloat, leadingPadding: CGFloat)]
    @Published var currentFlowerIndex: Int
    @Published var isDoneShowing: Bool
    
    init() {
        self.normalTimeToChangePage = 2.0
        self.flowerAndAppleAppearTime = 0.2
        self.allFlowers = FlowerBloomImage.allCases.shuffled()
        self.visibleFlowers = []
        self.displayedImages = []
        self.currentFlowerIndex = 0
        self.isDoneShowing = false
    }
    
    func addNextFlower() {
        if self.currentFlowerIndex < self.allFlowers.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + flowerAndAppleAppearTime) {
                let flower = self.allFlowers[self.currentFlowerIndex]
                self.visibleFlowers.append(flower)
                self.displayedImages.append(flower.flowerImage)
                self.currentFlowerIndex += 1
                self.addNextFlower()
            }
        } else {
            self.toggleIsDoneShowing()
        }
    }
    
    func replaceFlowersWithApple(with imageKeyPath: KeyPath<FlowerBloomImage, (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)?>) {
        for (index, flower) in self.visibleFlowers.enumerated() {
            if let appleImage = flower[keyPath: imageKeyPath]?.image,
               let topPadding = flower[keyPath: imageKeyPath]?.topPadding,
               let leadingPadding = flower[keyPath: imageKeyPath]?.leadingPadding,
               self.displayedImages[index].image != appleImage {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * flowerAndAppleAppearTime) {
                    self.displayedImages[index] = (appleImage, topPadding, leadingPadding)
                }
            }
        }
        
        self.toggleIsDoneShowing()
    }
    
    func toggleIsDoneShowing() {
        self.isDoneShowing.toggle()
    }
    
    func returnToMainViewDuration(growthProgress: PlantGrowthProgress) -> CGFloat {
        switch growthProgress {
            case .progress11, .progress12:
                return (Double(self.visibleFlowers.count) * self.flowerAndAppleAppearTime) + self.normalTimeToChangePage
            default:
                return normalTimeToChangePage
        }
    }
    
    func returnToMainView(growthProgress: PlantGrowthProgress, completion: (() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + returnToMainViewDuration(growthProgress: growthProgress)) {
            self.toggleIsDoneShowing()
            completion?()
        }
    }
    
    func customPaddingLeading(defaultPaddingLeading: CGFloat) -> CGFloat {
        switch UIScreen.main.bounds.width {
            case ..<385:
                return (defaultPaddingLeading + 3)
            case 385..<410:
                return defaultPaddingLeading
            default:
                return (defaultPaddingLeading + 23)
        }
    }
    
    func customPaddingTop(defaultPaddingTop: CGFloat) -> CGFloat {
        switch UIScreen.main.bounds.width {
            case ..<385:
                return (defaultPaddingTop - 46)
            case 385..<400:
                return defaultPaddingTop
            case 400..<410:
                return (defaultPaddingTop + 20)
            default:
                return (defaultPaddingTop + 80)
        }
    }

}
