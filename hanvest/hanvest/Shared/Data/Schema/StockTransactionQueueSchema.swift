//
//  StockInvestmentTransactionSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation
import SwiftData

@Model final class StockTransactionQueueSchema: Equatable, Hashable {
    @Attribute(.unique) var transactionID: String
    var stockIDName: String
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
    
    init(transactionID: String, stockIDName: String, priceAtPurchase: Int, stockLotQuantity: Int, time: Date) {
        self.transactionID = transactionID
        self.stockIDName = stockIDName
        self.priceAtPurchase = priceAtPurchase
        self.stockLotQuantity = stockLotQuantity
        self.time = time
    }
    
    func update(stockInvestmentTransactionSchema: StockTransactionQueueSchema) {
        self.transactionID = stockInvestmentTransactionSchema.transactionID
        self.priceAtPurchase = stockInvestmentTransactionSchema.priceAtPurchase
        self.stockLotQuantity = stockInvestmentTransactionSchema.stockLotQuantity
        self.time = stockInvestmentTransactionSchema.time
    }
    
    func update(newPriceAtUpdate: Int) {
        self.priceAtPurchase = newPriceAtUpdate
    }
    
    func update(stockLotQuantity: Int) {
        self.stockLotQuantity = stockLotQuantity
    }
    
    func update(time: Date) {
        self.time = time
    }
    
    func mapToEntity() -> StockTransactionQueueEntity {
        return StockTransactionQueueEntity(
            transactionID: self.transactionID,
            stockIDName: self.stockIDName,
            priceAtPurchase: self.priceAtPurchase,
            stockLotQuantity: self.stockLotQuantity,
            time: Date.distantPast
        )
    }
}
