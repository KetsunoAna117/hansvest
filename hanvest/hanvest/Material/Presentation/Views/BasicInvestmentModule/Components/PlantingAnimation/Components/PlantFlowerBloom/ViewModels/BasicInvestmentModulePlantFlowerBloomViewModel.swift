//
//  HanvestPlantFlowerBloomViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 06/11/24.
//

import SwiftUI

class BasicInvestmentModulePlantFlowerBloomViewModel: ObservableObject {
    let normalTimeToChangePage: CGFloat
    let flowerAndAppleAppearTime: CGFloat
    let allFlowers: [BasicInvestmentModuleFlowerBloomImage]
    
    @Published var visibleFlowers: [BasicInvestmentModuleFlowerBloomImage]
    @Published var displayedImages: [(image: Image, bottomPadding: CGFloat, leadingPadding: CGFloat)]
    @Published var currentFlowerIndex: Int
    @Published var isDoneShowing: Bool
    
    init() {
        self.normalTimeToChangePage = 1.5
        self.flowerAndAppleAppearTime = 0.15
        self.allFlowers = BasicInvestmentModuleFlowerBloomImage.allCases.shuffled()
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
    
    func replaceFlowersWithApple(with imageKeyPath: KeyPath<BasicInvestmentModuleFlowerBloomImage, (image: Image, bottomPadding: CGFloat, leadingPadding: CGFloat)?>) {
        for (index, flower) in self.visibleFlowers.enumerated() {
            if let appleImage = flower[keyPath: imageKeyPath]?.image,
               let bottomPadding = flower[keyPath: imageKeyPath]?.bottomPadding,
               let leadingPadding = flower[keyPath: imageKeyPath]?.leadingPadding,
               self.displayedImages[index].image != appleImage {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * flowerAndAppleAppearTime) {
                    self.displayedImages[index] = (appleImage, bottomPadding, leadingPadding)
                }
            }
        }
        
        self.toggleIsDoneShowing()
    }
    
    func toggleIsDoneShowing() {
        self.isDoneShowing.toggle()
    }
    
    func returnToMainViewDuration(growthProgress: BasicInvestmentModulePlantGrowthProgress) -> CGFloat {
        switch growthProgress {
            case .progress11, .progress12:
                return (Double(self.visibleFlowers.count) * self.flowerAndAppleAppearTime) + self.normalTimeToChangePage
            default:
                return normalTimeToChangePage
        }
    }
    
    func returnToMainView(growthProgress: BasicInvestmentModulePlantGrowthProgress, completion: (() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + returnToMainViewDuration(growthProgress: growthProgress)) {
            self.toggleIsDoneShowing()
            completion?()
        }
    }

}
