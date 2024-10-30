//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserInvestmentData {
    func execute(stockIDName: String, userData: UserDataEntity) -> StockInvestmentEntity?
}

struct GetUserInvestmentDataImpl: GetUserInvestmentData {
    func execute(stockIDName: String, userData: UserDataEntity) -> StockInvestmentEntity? {
        return userData.userInvestmentTransaction.filter({ investment in
            investment.stockIDName == stockIDName
        }).first
    }
}
