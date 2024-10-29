//
//  Module05ProfileViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

import Foundation

class Module05ProfileViewModel: ObservableObject {
    var userData: UserDataEntity?
    
    func setup(){
        self.userData = UserDataEntity(
            userId: "user-module-simulation",
            userName: "user-module-simulation",
            userBalance: 1000000,
            userRiskProfile: .conservative,
            userInvestmentTransaction: [],
            transactionQueue: [],
            moduleCompletionList: []
        )
    }
    
    func addUserInvestmentTransaction(transaction: StockTransactionQueueEntity){
        if userData != nil {
            userData?.userInvestmentTransaction.append(transaction)
            userData?.userBalance -= transaction.stockLotQuantity * transaction.priceAtPurchase
        }
    }
}
