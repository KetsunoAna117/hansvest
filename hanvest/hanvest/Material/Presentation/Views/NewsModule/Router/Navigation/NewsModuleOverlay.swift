//
//  Module06Overlay.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

enum Module06Overlay: Equatable, Hashable, Identifiable {
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

extension Module06Overlay {
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
    static func == (lhs: Module06Overlay, rhs: Module06Overlay) -> Bool {
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
