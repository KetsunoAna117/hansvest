//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserTransaction {
    func execute(stockIDName: String, userData: UserDataEntity) -> [StockTransactionEntity]
}

struct GetUserTransactionImpl: GetUserTransaction {
    func execute(stockIDName: String, userData: UserDataEntity) -> [StockTransactionEntity] {        
        return userData.userInvestmentTransaction.filter({ transaction in
            transaction.stockIDName == stockIDName
        })
    }
}
