//
//  PurchaseStocks.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation

protocol PurchaseStocks {
    func execute(
        userId: String,
        stockIDName: String,
        transaction: StockTransactionEntity
    ) -> Result<Bool, Error>
}

struct PurchaseStocksImpl: PurchaseStocks {
    let userRepo: UserRepository
    let investmentRepo: StockInvestmentRepository
    let transactionRepo: StockTransactionRepository
    
    func execute(
        userId: String,
        stockIDName: String,
        transaction: StockTransactionEntity
    ) -> Result<Bool, any Error> {
        do {
            // Fetch User Data
            guard let userData = userRepo.fetch() else {
                return .failure(SwiftDataError.notFound(object: userId))
            }
            
            // Fetch Investment
            if let investment = investmentRepo.fetchBy(
                userID: userId,
                stockIDName: stockIDName
            ) {
                // If investment already created, append transaction based on investmentID
                try transactionRepo.save(
                    .init(
                        transactionID: transaction.transactionID,
                        investmentID: investment.investmentID,
                        priceAtPurchase: transaction.priceAtPurchase,
                        stockLotQuantity: transaction.stockLotQuantity,
                        time: transaction.time
                    )
                )
                // Update investment Data
                investmentRepo.add(investmentID: <#T##String#>, with: <#T##StockInvestmentSchema#>)
            }
            else {
                // If investment is not found, create new investment
                let newInvestment = StockInvestmentSchema(
                    investmentID: UUID().uuidString,
                    stockIDName: stockIDName,
                    totalInvested: transaction.priceAtPurchase * transaction.stockLotQuantity * 100,
                    lotPurchased: transaction.stockLotQuantity,
                    userID: userId
                )
            }
            
            
            
            
            return .success(true)
        }
        catch {
            return .failure(error)
        }
    }
}
