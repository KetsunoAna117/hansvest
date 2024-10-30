//
//  SaveUserProgress.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

protocol SaveUserModuleProgress {
    func execute(data: CompletionEntityType) throws
}

struct SaveUserModuleProgressImpl: SaveUserModuleProgress {
    let userRepo: UserRepository
    
    func execute(data: CompletionEntityType) throws {
        try userRepo.add(moduleCompletion: data)
        try userRepo.add(balance: data.value.bonusMoney)
    }
}
