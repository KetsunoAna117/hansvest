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
    
    func add(data: StockInvestmentSchema) {
        self.totalInvested += data.totalInvested
        self.lotPurchased += data.lotPurchased
    }
    
    func substract(from data: StockInvestmentSchema) {
        if self.totalInvested - data.totalInvested < 0 {
            self.totalInvested = 0
        }
        else {
            self.totalInvested -= data.totalInvested
        }
        self.lotPurchased -= data.lotPurchased
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
