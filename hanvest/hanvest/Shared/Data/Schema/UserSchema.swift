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
    var moduleCompletionIDList: [CompletionEntityType]
    
    init(
        userId: String,
        userName: String,
        userBalance: Int,
        userRiskProfile: RiskProfileType,
        moduleCompletionIDList: [CompletionEntityType]
    ) {
        self.userId = userId
        self.userName = userName
        self.userBalance = userBalance
        self.userRiskProfile = userRiskProfile
        self.moduleCompletionIDList = moduleCompletionIDList
    }
    
    func update(newUserData: UserSchema) {
        self.userName = newUserData.userName
        self.userBalance = newUserData.userBalance
        self.userRiskProfile = newUserData.userRiskProfile
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
    
    func add(moduleCompletion: CompletionEntityType) {
        self.moduleCompletionIDList.append(moduleCompletion)
    }
    
    func delete(moduleCompletion: CompletionEntityType) throws {
        moduleCompletionIDList.removeAll(where: { $0 == moduleCompletion })
    }
    
    func mapToEntity(
        stockInvestmentSchema: [StockInvestmentSchema],
        stockInvestmentTransaction: [StockTransactionSchema],
        transactionQueue: [StockTransactionQueueSchema],
        userNotificationList: [UserNotificationSchema],
        stockNewsList: [StockNewsSchema]
    ) -> UserDataEntity {
        
        // Group transactions and stock news for efficient lookups
        let transactionsByInvestmentID = Dictionary(grouping: stockInvestmentTransaction, by: { $0.investmentID })
        
        return UserDataEntity(
            userId: self.userId,
            userName: self.userName,
            userBalance: self.userBalance,
            userRiskProfile: self.userRiskProfile,
            
            userInvestmentTransaction: stockInvestmentSchema.map { investment in
                investment.mapToEntity(
                    stockTransactionSchema: (transactionsByInvestmentID[investment.investmentID] ?? [])
                        .sorted(by: { $0.time < $1.time })
                )
            },
            
            transactionQueue: transactionQueue
                .map { $0.mapToEntity() }
                .sorted(by: { $0.time < $1.time }),
            
            moduleCompletionList: self.moduleCompletionIDList,
            
            notificationList: userNotificationList.map { notification in
                notification.mapToEntity(stockNews: stockNewsList.first(where: { news in
                    notification.stockNewsID == news.newsID
                }) ?? .init(newsID: "nodata-404", stockIDName: "No Data", newsTitle: "No Data", newsContent: "No Data", stockFluksPercentage: 0))
            }
        )
    }
    
}
