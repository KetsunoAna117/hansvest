//
//  ShowCaseRootViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 31/10/24.
//

import SwiftUI

class HighlightViewModel: ObservableObject {
    /// View properties
    @Published var stage: String
    @Published var highlightOrder: [Int]
    @Published var showView: Bool
    @Published var currentHighlight: Int
    /// popover
    @Published var showTitle: Bool
    @Published var positionUpOrDown: Bool
    
    init() {
        self.stage = ""
        self.highlightOrder = []
        self.showView = true
        self.currentHighlight = 0
        self.showTitle = true
        self.positionUpOrDown = true
    }
    
    func resetCurrectHighlightValue() {
        currentHighlight = 0
    }
    
    func resetHighlightViewState() {
        resetCurrectHighlightValue()
        showView = true
        showTitle = true
    }
    
    func setNewPopUpPosition(midYPosition: CGFloat, screenHeight: CGFloat) {
        positionUpOrDown = midYPosition < screenHeight / 2
    }
    
    func updateCurrentHighlight() {
        if currentHighlight >= highlightOrder.count - 1 {
            withAnimation(.easeInOut(duration: 0.25)) {
                showView = false
            }
            resetCurrectHighlightValue()
        } else {
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7)) {
                currentHighlight += 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.showTitle = true
            }
        }
    }
}
