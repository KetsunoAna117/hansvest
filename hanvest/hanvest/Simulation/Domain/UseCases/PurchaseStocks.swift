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
                
                // Update Investment Data
                let totalInvested = transaction.priceAtPurchase * transaction.stockLotQuantity * 100
                try investmentRepo.add(
                    investmentID: investment.investmentID,
                    totalInvested: totalInvested,
                    lotPurchased: transaction.stockLotQuantity
                )
                
                try userRepo.substract(balance: totalInvested)
            }
            else {
                // Get total invested value
                let totalInvested = transaction.priceAtPurchase * transaction.stockLotQuantity * 100
                
                // If investment is not found, create new investment
                let newInvestment = StockInvestmentSchema(
                    investmentID: UUID().uuidString,
                    stockIDName: stockIDName,
                    totalInvested: totalInvested,
                    lotPurchased: transaction.stockLotQuantity,
                    userID: userId
                )
                
                // Save Investment
                try investmentRepo.save(investment: newInvestment)
                
                // Save Transaction
                try transactionRepo.save(
                    .init(
                        transactionID: transaction.transactionID,
                        investmentID: newInvestment.investmentID,
                        priceAtPurchase: transaction.priceAtPurchase,
                        stockLotQuantity: transaction.stockLotQuantity,
                        time: transaction.time
                    )
                )
                
                // Substract User Balance
                try userRepo.substract(balance: totalInvested)
            }
            return .success(true)
        }
        catch {
            return .failure(error)
        }
    }
}
