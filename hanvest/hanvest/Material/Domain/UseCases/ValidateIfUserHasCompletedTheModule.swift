//
//  ValidateIfUserHasCompletedTheModule.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/10/24.
//

import Foundation

protocol ValidateIfUserHasCompletedTheModule {
    func execute(specificModule: CompletionEntityType) throws -> Bool
}

struct ValidateIfUserHasCompletedTheModuleImpl: ValidateIfUserHasCompletedTheModule {
    let repo: UserRepository
    
    func execute(specificModule: CompletionEntityType) throws -> Bool {
        if let user = repo.fetch(){
            let checkUserModule = user.moduleCompletionIDList.contains(where: { $0.value.moduleID == specificModule.value.moduleID})
            
            return checkUserModule
        }
        
        return false
    }
}
