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
    
    func execute() -> UserDataEntity? {
        if let user = userRepo.fetch(){
            let investmentSchema = investmentRepo.fetchBy(userID: user.userId)
            
            let transactionSchema = investmentSchema.compactMap({ investment in
                transactionRepo.fetchWith(investmentID: investment.investmentID)
            })
            .flatMap({ $0 })
            
            let transactionQueueSchema = transactionQueueRepo.fetchWith(userID: user.userId)
            
            return user.mapToEntity(
                stockInvestmentSchema: investmentSchema,
                stockInvestmentTransaction: transactionSchema,
                transactionQueue: transactionQueueSchema
            )
        }
        
        return nil
    }
}
