//
//  StockInvestmentTransactionSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation
import SwiftData

@Model final class StockTransactionSchema: Equatable, Hashable {
    @Attribute(.unique) var transactionID: String
    var investmentID: String // FK
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
    
    init(
        transactionID: String,
        investmentID: String,
        priceAtPurchase: Int,
        stockLotQuantity: Int,
        time: Date
    ) {
        self.transactionID = transactionID
        self.investmentID = investmentID
        self.priceAtPurchase = priceAtPurchase
        self.stockLotQuantity = stockLotQuantity
        self.time = time
    }
    
    func mapToEntity(
        stockIDName: String
    ) -> StockTransactionEntity {
        return StockTransactionEntity(
            transactionID: self.transactionID,
            stockIDName: stockIDName,
            priceAtPurchase: self.priceAtPurchase,
            stockLotQuantity: self.stockLotQuantity,
            time: Date.distantPast
        )
    }
}
