//
//  UserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

struct UserDataEntity: Equatable {
    var userId: String
    var userName: String
    var userBalance: Int
    var userRiskProfile: RiskProfileType
    var userInvestmentTransaction: [StockInvestmentEntity]
    var transactionQueue: [StockTransactionQueueEntity]
    var moduleCompletionList: [CompletionEntityType]
    var notificationList: [UserNotificationEntity]
}

extension UserDataEntity {
    func mapToSchema() -> UserSchema {
        return UserSchema(
            userId: self.userId,
            userName: self.userName,
            userBalance: self.userBalance,
            userRiskProfile: self.userRiskProfile,
            moduleCompletionIDList: self.moduleCompletionList
        )
    }
}

extension UserDataEntity {
    // Conform to equatable
    static func == (lhs: UserDataEntity, rhs: UserDataEntity) -> Bool {
        return lhs.userId == rhs.userId
    }
}


//extension UserDataEntity {
//    static func mock() -> UserDataEntity {
//        return UserDataEntity(
//            userId: UUID().uuidString,
//            userName: "Bryon",
//            userBalance: 2000000,
//            userRiskProfile: .aggresive,
//            userInvestmentTransaction: StockTransactionEntity.mock(),
//            transactionQueue: [
//                StockTransactionEntity(
//                    transactionID: UUID().uuidString,
//                    stockIDName: "BBRI",
//                    priceAtPurchase: 1000,
//                    stockLotQuantity: 2,
//                    time: Date.now
//                )
//            ],
//            moduleCompletionList: [.basicInvestmentModule, .liabilitiesVsAssetModule]
//        )
//    }
//}
