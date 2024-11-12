//
//  Module05Overlay.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

enum FundamentalModuleOverlay: Equatable, Hashable, Identifiable {
    case withBuyConfirmationPopup(
        buyingStockDataViewModel: BuyingStockDataViewModel,
        confirmAction: () -> (),
        cancelAction: () -> ()
    )
    
    case withSellConfirmationPopup(
        sellingStockDataViewModel: SellingStockDataViewModel,
        confirmAction: () -> (),
        cancelAction: () -> ()
    )
    
    var id: Self { return self }
}

extension FundamentalModuleOverlay {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .withBuyConfirmationPopup,
                .withSellConfirmationPopup:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: FundamentalModuleOverlay, rhs: FundamentalModuleOverlay) -> Bool {
        switch (lhs, rhs){
        case (.withBuyConfirmationPopup, .withBuyConfirmationPopup),
            (.withSellConfirmationPopup, .withSellConfirmationPopup):
            return true
        default:
            return false
        }
        
    }
}
