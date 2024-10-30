//
//  SaveUserData.swift
//  hanvest
//
//  Created by Bryan Vernanda on 25/10/24.
//

import Foundation

protocol SaveUserData {
    func execute() throws
}

struct SaveUserDataImpl: SaveUserData {
    let userRepo: UserRepository
    
    func execute() throws {
        let userSchema = UserSchema(
            userId: UUID().uuidString,
            userName: "Bryon",
            userBalance: 100000,
            userRiskProfile: .conservative,
            userInvestmentTransactionID: [
                "transaction-01",
                "transaction-02",
                "transaction-03"
            ],
            transactionQueueID: [
                "transaction-04"
            ],
            moduleCompletionIDList: []
        )
        
        try userRepo.save(userSchema)
    }
}
