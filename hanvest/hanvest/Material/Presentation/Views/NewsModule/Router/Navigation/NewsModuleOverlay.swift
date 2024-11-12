//
//  Module06Overlay.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

enum NewsModuleOverlay: Equatable, Hashable, Identifiable {
    case withHanvestPopup(title: String? = nil, desc: String, dismissAction: () -> Void)
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

extension NewsModuleOverlay {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .withBuyConfirmationPopup,
                .withHanvestPopup,
                .withSellConfirmationPopup:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: NewsModuleOverlay, rhs: NewsModuleOverlay) -> Bool {
        switch (lhs, rhs){
        case (.withBuyConfirmationPopup, .withBuyConfirmationPopup),
            (.withSellConfirmationPopup, .withSellConfirmationPopup),
            (.withHanvestPopup, .withHanvestPopup):
            return true
        default:
            return false
        }
        
    }
}
