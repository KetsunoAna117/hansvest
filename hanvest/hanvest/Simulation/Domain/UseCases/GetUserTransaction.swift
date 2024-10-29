//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserTransaction {
    func execute(stockIDName: String, userData: UserDataEntity) -> [StockTransactionQueueEntity]
}

struct GetUserTransactionImpl: GetUserTransaction {
    func execute(stockIDName: String, userData: UserDataEntity) -> [StockTransactionQueueEntity] {        
        return userData.userInvestmentTransaction.filter({ transaction in
            transaction.stockIDName == stockIDName
        })
    }
}
