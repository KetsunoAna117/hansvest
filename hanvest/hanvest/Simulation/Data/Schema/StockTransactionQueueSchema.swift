//
//  StockTransactionQueueSche,a.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 05/11/24.
//

import Foundation
import SwiftData

@Model
final class StockTransactionQueueSchema {
    @Attribute(.unique) var transactionQueueID: String
    var stockIDName: String // FK
    var userID: String // FK
    var priceAtPurchase: Int
    var lotPurchaseQuantity: Int
    var time: Date
    
    init(
        transactionQueueID: String,
        stockIDName: String,
        userID: String,
        priceAtPurchase: Int,
        lotPurchaseQuantity: Int,
        time: Date
    ) {
        self.transactionQueueID = transactionQueueID
        self.stockIDName = stockIDName
        self.userID = userID
        self.priceAtPurchase = priceAtPurchase
        self.lotPurchaseQuantity = lotPurchaseQuantity
        self.time = time
    }
    
    func mapToEntity() -> StockTransactionQueueEntity {
        return .init(
            transactionQueueID: self.transactionQueueID,
            stockIDName: self.stockIDName,
            priceAtPurchase: self.priceAtPurchase,
            lotPurchaseQuantity: self.lotPurchaseQuantity,
            time: self.time
        )
    }
}
