//
//  ShowCaseRootViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 31/10/24.
//

import SwiftUI

class HighlightViewModel: ObservableObject {
    /// View properties
    @Published var stage: HighlightComponentStage = .mainStage
    @Published var highlightOrder: [Int] = []
    @Published var showView: Bool = true
    @Published var currentHighlight: Int = 0
    /// popover
    @Published var showTitle: Bool = true
    @Published var positionUpOrDown: Bool = true
    
    func resetCurrectHighlightValue() {
        currentHighlight = 0
    }
    
    func resetHighlightViewState() {
        resetCurrectHighlightValue()
        showView = true
        showTitle = true
    }
}
