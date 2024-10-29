//
//  TransactionStatusViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 19/10/24.
//

import Foundation

struct TransactionStatusViewModel {
    @Inject var purchaseStock: PurchaseStocks
    @Inject var getUserData: GetUserData
    
    var lotAmount: Int
    var stockPrice: Int
    var selectedStockIDName: String
    var transactionType: TransactionType
    
    func executeTransaction(appRouter: any AppRouterProtocol){
        switch self.transactionType {
        case .buy:
            self.buyStock(appRouter: appRouter)
        case .sell:
            break
        }
    }
    
    func buyStock(appRouter: any AppRouterProtocol){
        guard let user = getUserData.execute() else { return }
        let result = purchaseStock.execute(
            userId: user.userId,
            transaction: StockTransactionQueueEntity(
                transactionID: UUID().uuidString,
                stockIDName: self.selectedStockIDName,
                priceAtPurchase: self.stockPrice,
                stockLotQuantity: self.lotAmount,
                time: Date.now
            )
        )
        
        switch result {
        case .success(let success):
            if success {
                appRouter.popToRoot()
            }
        case .failure(let failure):
            print("[ERROR]: Failure with error: \(failure)")
        }
    }
}
