//
//  StockInvestmentSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation
import SwiftData

@Model
final class StockInvestmentSchema {
    @Attribute(.unique) var investmentID: String
    var stockIDName: String // FK
    var userID: String // FK
    var totalInvested: Int
    var lotPurchased: Int
    
    init(
        investmentID: String,
        stockIDName: String,
        totalInvested: Int,
        lotPurchased: Int,
        userID: String
    ) {
        self.investmentID = investmentID
        self.stockIDName = stockIDName
        self.totalInvested = totalInvested
        self.lotPurchased = lotPurchased
        self.userID = userID
    }
    
    func add(totalInvested: Int, lotPurchased: Int) {
        self.totalInvested += totalInvested
        self.lotPurchased += lotPurchased
    }
    
    func substract(totalInvested: Int, lotPurchased: Int) {
        self.totalInvested -= totalInvested
        self.lotPurchased -= lotPurchased
    }
    
    func mapToEntity(
        stockTransactionSchema: [StockTransactionSchema]
    ) -> StockInvestmentEntity {
        return .init(
            investmentID: self.investmentID,
            stockIDName: self.stockIDName,
            totalInvested: self.totalInvested,
            lotPurchased: self.lotPurchased,
            stockTransaction: stockTransactionSchema.map {
                $0.mapToEntity(stockIDName: stockIDName)
            }
        )
    }
}
