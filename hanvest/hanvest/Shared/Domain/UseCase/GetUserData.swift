//
//  GetUserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

protocol GetUserData {
    func execute() -> UserDataEntity?
}

struct GetUserDataImpl: GetUserData {
    let userRepo: UserRepository
    let transactionRepo: StockTransactionRepository
    let transactionQueueRepo: StockTransactionQueueRepository
    let investmentRepo: StockInvestmentRepository
    let notificationRepo: UserNotificationRepository
    let newsRepo: StockNewsRepository
    
    func execute() -> UserDataEntity? {
        if let user = userRepo.fetch(){
            let investmentSchema = investmentRepo.fetchBy(userID: user.userId)
            
            let transactionSchema = investmentSchema.compactMap({ investment in
                transactionRepo.fetchWith(investmentID: investment.investmentID)
            })
            .flatMap({ $0 })
            
            let transactionQueueSchema = transactionQueueRepo.fetchWith(userID: user.userId)
            
            let notificationSchema = notificationRepo.fetchBy(userID: user.userId)
            let newsSchema = notificationSchema.compactMap({ notification in
                newsRepo.fetch(id: notification.stockNewsID)
            })
            
            return user.mapToEntity(
                stockInvestmentSchema: investmentSchema,
                stockInvestmentTransaction: transactionSchema,
                transactionQueue: transactionQueueSchema,
                userNotificationList: notificationSchema,
                stockNewsList: newsSchema
            )
        }
        
        return nil
    }
}
