//
//  PurchaseStocks.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation

protocol PurchaseStocks {
    func execute(userId: String, transaction: StockTransactionQueueEntity) -> Result<Bool, Error>
}

struct PurchaseStocksImpl: PurchaseStocks {
    let userRepo: UserRepository
    let stockTransactionRepository: StockTransactionQueueRepository
    
    func execute(userId: String, transaction: StockTransactionQueueEntity) -> Result<Bool, any Error> {
        do {
            let price = transaction.stockLotQuantity * transaction.priceAtPurchase * 100
            
            try userRepo.substract(balance: price)
            try userRepo.add(transaction: transaction.mapToSchema())
            try stockTransactionRepository.save(transaction.mapToSchema())
            return .success(true)
        }
        catch {
            return .failure(error)
        }
    }
}
