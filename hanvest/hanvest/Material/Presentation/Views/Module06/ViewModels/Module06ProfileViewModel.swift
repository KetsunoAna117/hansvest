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
                    investmentID: "investment-01",
                    stockIDName: "GOTO",
                    totalInvested: 9 * 1000 * 100,
                    lotPurchased: 9
                )
            ],
            transactionQueue: [],
            moduleCompletionList: []
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
