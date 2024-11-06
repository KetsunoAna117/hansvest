//
//  UserRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

protocol UserRepository {
    func fetch() -> UserSchema?
    func save(_ userSchema: UserSchema) throws -> Void
    func update(name: String) throws -> Void
    func add(moduleCompletion: CompletionEntityType) throws -> Void
    func add(balance: Int) throws -> Void
    func substract(balance: Int) throws -> Void
}
