//
//  SellStocks.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation

protocol SellStocks {
    func execute(
        userId: String,
        stockIDName: String,
        transaction: StockTransactionEntity
    ) -> Result<Bool, Error>
}

struct SellStocksImpl: SellStocks {
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
                let fetchedTransactionList = transactionRepo.fetchWith(
                    investmentID: investment.investmentID
                )
                
                guard fetchedTransactionList.isEmpty == false else {
                    return .failure(SwiftDataError.noData( "no transaction found"))
                }
                
                let averageTransactionPrice = getAverage(transactionList: fetchedTransactionList)
                let invesmentToSubstract = averageTransactionPrice * transaction.stockLotQuantity
                
                try investmentRepo.substract(
                    investmentID: investment.investmentID,
                    totalInvested: invesmentToSubstract,
                    lotPurchased: transaction.stockLotQuantity
                )
                
                let newBalance = transaction.stockLotQuantity * transaction.priceAtPurchase * 100
                try userRepo.add(balance: newBalance)
            }
            
            return .success(true)
        }
        catch {
            return .failure(error)
        }
    }
    
    func getAverage(transactionList: [StockTransactionSchema]) -> Int {
        var totalInvestedLotAmount = 0
        var totalTransactionAmount = 0
        
        for transaction in transactionList {
            totalInvestedLotAmount += transaction.stockLotQuantity
            totalTransactionAmount += transaction.stockLotQuantity * transaction.priceAtPurchase * 100
        }
        
        guard totalInvestedLotAmount != 0 else { return 0 }
        
        return totalTransactionAmount / totalInvestedLotAmount
    }
}
