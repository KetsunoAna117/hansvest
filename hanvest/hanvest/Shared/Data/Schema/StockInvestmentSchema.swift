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
    var stockIDName: String
    var totalInvested: Int
    var lotPurchased: Int
    
    init(investmentID: String, stockIDName: String, totalInvested: Int, lotPurchased: Int) {
        self.investmentID = investmentID
        self.stockIDName = stockIDName
        self.totalInvested = totalInvested
        self.lotPurchased = lotPurchased
    }
    
    func add(lotPurchased: Int) {
        self.lotPurchased += lotPurchased
    }
    
    func add(totalInvested: Int) {
        self.totalInvested += totalInvested
    }
    
    func substract(lotPurchased: Int) {
        self.lotPurchased -= lotPurchased
    }
    
    func substract(totalInvested: Int) {
        self.totalInvested -= totalInvested
    }
    
    func update(newStockInvestmentSchema data: StockInvestmentSchema) {
        self.stockIDName = data.stockIDName
        self.totalInvested = data.totalInvested
        self.lotPurchased = data.lotPurchased
    }
    
    func mapToEntity() -> StockInvestmentEntity {
        return .init(
            investmentID: self.investmentID,
            stockIDName: self.stockIDName,
            totalInvested: self.totalInvested,
            lotPurchased: self.lotPurchased
        )
    }
}
