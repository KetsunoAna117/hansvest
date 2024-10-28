//
//  Module06ProfileViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

class Module06ProfileViewModel: ObservableObject {
    var userData: UserDataEntity?
    
    func setup(){
        self.userData = UserDataEntity(
            userId: "user-module-simulation",
            userName: "user-module-simulation",
            userBalance: 1000000,
            userRiskProfile: .conservative,
            userInvestmentTransaction: [
                .init(
                    transactionID: "transaction-01",
                    stockIDName: "GOTO",
                    priceAtPurchase: 1000,
                    stockLotQuantity: 9,
                    time: Date.now
                )
            ],
            transactionQueue: [],
            moduleCompletionList: []
        )
    }
    
    func addUserInvestmentTransaction(transaction: StockTransactionEntity){
        if userData != nil {
            userData?.userInvestmentTransaction.append(transaction)
            userData?.userBalance -= transaction.stockLotQuantity * transaction.priceAtPurchase
        }
    }
}
