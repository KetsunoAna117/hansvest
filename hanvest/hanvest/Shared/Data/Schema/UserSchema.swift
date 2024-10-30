//
//  UserSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import SwiftData

@Model final class UserSchema {
    @Attribute(.unique) var userId: String
    var userName: String
    var userBalance: Int
    var userRiskProfile: RiskProfileType
    var userInvestmentTransactionID: [String]
    var transactionQueueID: [String]
    var moduleCompletionIDList: [CompletionEntityType]
    
    init(userId: String, userName: String, userBalance: Int, userRiskProfile: RiskProfileType, userInvestmentTransactionID: [String], transactionQueueID: [String], moduleCompletionIDList: [CompletionEntityType]) {
        self.userId = userId
        self.userName = userName
        self.userBalance = userBalance
        self.userRiskProfile = userRiskProfile
        self.userInvestmentTransactionID = userInvestmentTransactionID
        self.transactionQueueID = transactionQueueID
        self.moduleCompletionIDList = moduleCompletionIDList
    }
    
    func update(newUserData: UserSchema) {
        self.userName = newUserData.userName
        self.userBalance = newUserData.userBalance
        self.userRiskProfile = newUserData.userRiskProfile
        self.userInvestmentTransactionID = newUserData.userInvestmentTransactionID
        self.transactionQueueID = newUserData.transactionQueueID
    }
    
    func add(newBalance: Int) {
        self.userBalance += newBalance
    }
    
    func substract(balanceToSubs: Int) {
        self.userBalance -= balanceToSubs
    }
    
    func update(newName: String) {
        self.userName = newName
    }
    
    func add(newUserInvestmentTransactionID: String) {
        self.userInvestmentTransactionID.append(newUserInvestmentTransactionID)
    }
    
    func update(newTransactionQueueID: [String]) {
        self.transactionQueueID = newTransactionQueueID
    }
    
    func add(moduleCompletion: CompletionEntityType) {
        self.moduleCompletionIDList.append(moduleCompletion)
    }
    
    func delete(moduleCompletion: CompletionEntityType) throws {
        moduleCompletionIDList.removeAll(where: { $0 == moduleCompletion })
    }
    
    func mapToEntity(
        userInvestmentTransaction: [StockInvestmentSchema],
        transactionQueue: [StockTransactionQueueSchema]
    ) -> UserDataEntity {
        return UserDataEntity(
            userId: self.userId,
            userName: self.userName,
            userBalance: self.userBalance,
            userRiskProfile: self.userRiskProfile,
            userInvestmentTransaction: userInvestmentTransaction.map { $0.mapToEntity() },
            transactionQueue: transactionQueue.map { $0.mapToEntity() }.sorted(by: { $0.time < $1.time }),
            moduleCompletionList: self.moduleCompletionIDList
        )
    }
}
