//
//  StockInvestmentTransaction.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct StockTransactionEntity {
    var transactionID: String
    var stockIDName: String
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
}

extension StockTransactionEntity {
    func mapToSchema(investmentID: String) -> StockTransactionSchema {
        return StockTransactionSchema(
            transactionID: self.transactionID,
            investmentID: investmentID,
            priceAtPurchase: self.priceAtPurchase,
            stockLotQuantity: self.stockLotQuantity,
            time: self.time
        )
    }
}
