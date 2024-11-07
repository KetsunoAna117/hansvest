//
//  UserRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation
import SwiftData

struct LocalUserRepository: UserRepository {    
    let modelContext: ModelContext?
    
    func fetch() -> UserSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                let userSchema = try context.fetch(descriptor)
                return userSchema.first
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return nil
    }
    
    func save(_ userSchema: UserSchema) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<UserSchema>()
            
            guard let fetchedUserSchema = try context.fetch(descriptor).first else {
                // Create new user if not found
                context.insert(userSchema)
                try? context.save()
                return
            }
            
            // Update if found
            fetchedUserSchema.update(newUserData: userSchema)
            try? context.save()
        }
    }
    
    func add(balance: Int) throws {
        if let context = modelContext{
            let descriptor = FetchDescriptor<UserSchema>()
            guard let fetchedUserSchema = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound()
            }
            
            fetchedUserSchema.add(newBalance: balance)
            try? context.save()
        }
    }
    
    func substract(balance: Int) throws {
        if let context = modelContext{
            let descriptor = FetchDescriptor<UserSchema>()
            guard let fetchedUserSchema = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound()
            }
            
            fetchedUserSchema.substract(balanceToSubs: balance)
            try context.save()
        }
    }
    
    func update(name: String) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<UserSchema>()
            guard let fetchedUserSchema = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound()
            }
            
            fetchedUserSchema.update(newName: name)
            try context.save()
        }
    }
    
    func add(moduleCompletion: CompletionEntityType) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<UserSchema>()
            guard let fetchedUserSchema = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound()
            }
            
            fetchedUserSchema.add(moduleCompletion: moduleCompletion)
            try context.save()
        }
    }
}
