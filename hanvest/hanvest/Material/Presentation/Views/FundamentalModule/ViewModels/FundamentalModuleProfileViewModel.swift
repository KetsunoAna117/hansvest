//
//  Module05ProfileViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

import Foundation

class FundamentalModuleProfileViewModel: ObservableObject {
    var userData: UserDataEntity?
    
    func setup(){
        self.userData = UserDataEntity(
            userId: "user-module-simulation",
            userName: "user-module-simulation",
            userBalance: 1000000,
            userRiskProfile: .conservative,
            userInvestmentTransaction: [],
            transactionQueue: [],
            moduleCompletionList: [],
            notificationList: []
        )
    }
    
    func addUserInvestmentTransaction(transaction: StockInvestmentEntity){
        if userData != nil {
            if let index = userData?.userInvestmentTransaction.firstIndex(where: { $0.stockIDName == transaction.stockIDName }) {
                userData?.userInvestmentTransaction[index].totalInvested += transaction.totalInvested
                userData?.userInvestmentTransaction[index].lotPurchased += transaction.lotPurchased
            }
            else {
                userData?.userInvestmentTransaction.append(transaction)
            }
            
            userData?.userBalance -= transaction.totalInvested
        }
    }
}
