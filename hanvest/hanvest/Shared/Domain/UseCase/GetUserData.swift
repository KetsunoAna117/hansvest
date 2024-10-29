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
    
    func execute() -> UserDataEntity? {
        if let user = userRepo.fetch(){
            let transaction = user.userInvestmentTransactionID.compactMap({ transactionID in
                return transactionRepo.fetch(id: transactionID)
            })
            
            let queue = user.transactionQueueID.compactMap({ transactionID in
                 return transactionRepo.fetch(id: transactionID)
            })
            
            return user.mapToEntity(
                userInvestmentTransaction: transaction,
                transactionQueue: queue
            )
        }
        
        return nil
    }
}
