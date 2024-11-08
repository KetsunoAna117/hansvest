//
//  TransactionStatusViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 19/10/24.
//

import Foundation

struct TransactionStatusViewModel {
    @Inject var purchaseStock: PurchaseStocks
    @Inject var sellStock: SellStocks
    @Inject var getUserData: GetUserData
    
    var lotAmount: Int
    var stockPrice: Int
    var selectedStockIDName: String
    var transactionType: TransactionType
    
    func executeTransaction() -> Bool {
        switch self.transactionType {
        case .buy:
            return buyStockAction()
        case .sell:
            return sellStockAction()
        }
    }
    
    func buyStockAction() -> Bool {
        guard let user = getUserData.execute() else { return false }
        let result = purchaseStock.execute(
            userId: user.userId,
            stockIDName: selectedStockIDName,
            transaction: .init(
                transactionID: UUID().uuidString,
                stockIDName: selectedStockIDName,
                priceAtPurchase: stockPrice,
                stockLotQuantity: lotAmount,
                time: Date.now
            )
        )
        
        switch result {
        case .success(let success):
            if success {
                return true
            }
        case .failure(let failure):
            debugPrint("[ERROR]: Failure Buy Stock with error: \(failure)")
        }
        
        return false
    }
    
    func sellStockAction() -> Bool {
        guard let user = getUserData.execute() else { return false }
        let result = sellStock.execute(
            userId: user.userId,
            stockIDName: selectedStockIDName,
            transaction: .init(
                transactionID: UUID().uuidString,
                stockIDName: selectedStockIDName,
                priceAtPurchase: stockPrice,
                stockLotQuantity: lotAmount,
                time: Date.now
            )
        )
        
        switch result {
        case .success(let success):
            if success {
                return true
            }
        case .failure(let failure):
            debugPrint("[ERROR]: Failure Sell Stock with error: \(failure)")
        }
        
        return false
    }
}
