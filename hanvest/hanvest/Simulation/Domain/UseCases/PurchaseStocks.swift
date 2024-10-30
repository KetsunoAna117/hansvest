//
//  PurchaseStocks.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation

protocol PurchaseStocks {
    func execute(userId: String, investment: StockInvestmentEntity) -> Result<Bool, Error>
}

struct PurchaseStocksImpl: PurchaseStocks {
    let userRepo: UserRepository
    let investmentRepo: StockInvestmentRepository
    
    func execute(userId: String, investment: StockInvestmentEntity) -> Result<Bool, any Error> {
        do {
            // Fetch User Data
            guard let userData = userRepo.fetch() else {
                return .failure(SwiftDataError.notFound)
            }
            
            let investmentSchema = investment.mapToSchema()
            
            // Fetch Investment Data from User
            let investmentData = userData.userInvestmentTransactionID.compactMap({ investmentID in
                investmentRepo.fetchBy(investmentID: investmentID)
            })
            
            if let investment = investmentData.first(where: { $0.stockIDName == investmentSchema.stockIDName }) {
                // If stockID already registered, update the value
                try investmentRepo.add(
                    investmentID: investment.investmentID,
                    with: investmentSchema
                )
            }
            else {
                // If no stockID registered from user investment, register it
                try userRepo.add(investment: investmentSchema)
                try investmentRepo.save(investment: investmentSchema)
            }
            
            // Substract User Balance from Invested Data
            try userRepo.substract(balance: investment.totalInvested)
            
            return .success(true)
        }
        catch {
            return .failure(error)
        }
    }
}
