//
//  StockTransactionQueueEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 05/11/24.
//

import Foundation

struct StockTransactionQueueEntity {
    var transactionQueueID: String
    var stockIDName: String
    var priceAtPurchase: Int
    var lotPurchaseQuantity: Int
    var time: Date
}

extension StockTransactionQueueEntity {
    func mapToSchema(userID: String) -> StockTransactionQueueSchema {
        return .init(
            transactionQueueID: self.transactionQueueID,
            stockIDName: self.stockIDName,
            userID: userID,
            priceAtPurchase: self.priceAtPurchase,
            lotPurchaseQuantity: self.lotPurchaseQuantity,
            time: self.time
        )
    }
}
