//
//  StockTransactionEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

struct StockInvestmentEntity {
    var investmentID: String
    var stockIDName: String
    var totalInvested: Int
    var lotPurchased: Int
    
    var stockTransaction: [StockTransactionEntity]
}

extension StockInvestmentEntity {
    func mapToSchema(
        userID: String
    ) -> StockInvestmentSchema {
        return .init(
            investmentID: self.investmentID,
            stockIDName: self.stockIDName,
            totalInvested: self.totalInvested,
            lotPurchased: self.lotPurchased,
            userID: userID
        )
    }
}
