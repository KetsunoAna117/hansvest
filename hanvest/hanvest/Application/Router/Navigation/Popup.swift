//
//  Popup.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

enum Popup: Identifiable, Hashable, Equatable {
    case withHanvestPopupButton(title: String?, desc: String, buttonAction: () -> Void)
    case withHanvestPopup(title: String?, desc: String, dismissAction: () -> Void)
    case withBuyConfirmationPopup(viewmodel: BuyingStockDataViewModel, confirmAction: () -> (), cancelAction: () -> ())
    case withSellConfirmationPopup(viewmodel: SellingStockDataViewModel, confirmAction: () -> (), cancelAction: () -> ())
    case withGlossaryPopup(title: String, desc: String, buttonAction: () -> Void)
    
    var id: Self { return self }
}

extension Popup {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .withHanvestPopup:
            hasher.combine(self.hashValue)
        case .withHanvestPopupButton:
            hasher.combine(self.hashValue)
        case .withBuyConfirmationPopup:
            hasher.combine(self.hashValue)
        case .withSellConfirmationPopup:
            hasher.combine(self.hashValue)
        case .withGlossaryPopup:
            hasher.combine(self.hashValue)
        }
    
    }
    
    // Conform to Equatable
    static func == (lhs: Popup, rhs: Popup) -> Bool {
        switch (lhs, rhs) {
        case (.withHanvestPopup, .withHanvestPopup),
            (.withBuyConfirmationPopup, .withBuyConfirmationPopup),
            (.withSellConfirmationPopup, .withSellConfirmationPopup),
            (.withHanvestPopupButton, .withHanvestPopupButton),
            (.withGlossaryPopup, .withGlossaryPopup):
            return true
        default:
            return false
        }
    }
}
