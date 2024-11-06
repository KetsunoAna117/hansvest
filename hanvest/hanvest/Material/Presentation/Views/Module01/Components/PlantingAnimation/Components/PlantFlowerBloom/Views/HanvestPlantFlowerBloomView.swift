//
//  PlantFlowerBloomView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantFlowerBloomView: View {
    // Constant
    private let normalTimeToChangePage: CGFloat = 2.0
    private let flowerAndAppleAppearTime: CGFloat = 0.2
    private let allFlowers = FlowerBloomImage.allCases.shuffled()
    
    @State private var visibleFlowers: [FlowerBloomImage] = []
    @State private var displayedImages: [(image: Image, topPadding: CGFloat, leadingPadding: CGFloat)] = []
    @State private var currentFlowerIndex = 0
    @Binding var growthProgress: PlantGrowthProgress
    
    var onCompletion: (() -> Void)?
    
    var body: some View {
        ZStack {
            ForEach(self.visibleFlowers.indices, id: \.self) { index in
                ZStack {
                    HStack {
                        self.displayedImages[index].image
                    }
                    .padding(.leading, customPaddingLeading(
                        defaultPaddingLeading: self.displayedImages[index].leadingPadding)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, customPaddingTop(
                    defaultPaddingTop: self.displayedImages[index].topPadding)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            self.addNextFlower()
        }
        .onChange(of: self.growthProgress) { _, newValue in
            if newValue == .progress11 {
                self.replaceFlowersWithApple(with: \.halfAppleImage)
            } else if newValue == .progress12 {
                self.replaceFlowersWithApple(with: \.fullAppleImage)
            }
        }
    }
    
    private func addNextFlower() {
        if self.currentFlowerIndex < self.allFlowers.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + flowerAndAppleAppearTime) {
                let flower = self.allFlowers[currentFlowerIndex]
                self.visibleFlowers.append(flower)
                self.displayedImages.append(flower.flowerImage)
                self.currentFlowerIndex += 1
                self.addNextFlower()
            }
        } else {
            self.returnToMainView(duration: normalTimeToChangePage)
        }
    }
    
    private func replaceFlowersWithApple(with imageKeyPath: KeyPath<FlowerBloomImage, (image: Image, topPadding: CGFloat, leadingPadding: CGFloat)?>) {
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
        
        let totalDelay = (Double(self.visibleFlowers.count) * self.flowerAndAppleAppearTime) + self.normalTimeToChangePage
        self.returnToMainView(duration: totalDelay)
    }
    
    private func returnToMainView(duration: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.onCompletion?()
        }
    }
    
    private func customPaddingLeading(defaultPaddingLeading: CGFloat) -> CGFloat {
        if UIScreen.main.bounds.width < 385 {
            return (defaultPaddingLeading + 3)
        } else {
            return defaultPaddingLeading
        }
    }
    
    private func customPaddingTop(defaultPaddingTop: CGFloat) -> CGFloat {
        if UIScreen.main.bounds.width < 385 {
            return (defaultPaddingTop - 46)
        } else {
            return defaultPaddingTop
        }
    }
}

#Preview {
    HanvestPlantFlowerBloomView(growthProgress: .constant(.progress01))
}
