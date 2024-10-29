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
    
    func addLotPurchased(_ lotPurchased: Int) {
        self.lotPurchased += lotPurchased
    }
    
    func addTotalInvested(_ totalInvested: Int) {
        self.totalInvested += totalInvested
    }
    
    func substractLotsPurchased(_ lotPurchased: Int) {
        self.lotPurchased -= lotPurchased
    }
    
    func substractTotalInvested(_ totalInvested: Int) {
        self.totalInvested -= totalInvested
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
