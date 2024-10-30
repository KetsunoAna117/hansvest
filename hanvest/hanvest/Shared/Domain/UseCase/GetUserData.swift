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
    let transactionRepo: StockTransactionQueueRepository
    let investmentRepo: StockInvestmentRepository
    
    func execute() -> UserDataEntity? {
        if let user = userRepo.fetch(){
            let investmentData = user.userInvestmentTransactionID.compactMap({ investmentID in
                return investmentRepo.fetchBy(investmentID: investmentID)
            })
            
            let transactionQueue = user.transactionQueueID.compactMap({ transactionID in
                 return transactionRepo.fetch(id: transactionID)
            })
            
            return user.mapToEntity(
                userInvestmentTransaction: investmentData,
                transactionQueue: transactionQueue
            )
        }
        
        return nil
    }
}
