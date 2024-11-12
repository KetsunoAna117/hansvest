//
//  LocalStockTransactionQueueRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 05/11/24.
//

import Foundation
import SwiftData

struct LocalStockTransactionQueueRepository: StockTransactionQueueRepository {
    let modelContext: ModelContext?
    
    func fetch() -> [StockTransactionQueueSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>()
                return try context.fetch(descriptor)
            }
            catch {
                debugPrint("Error Fetch StockTransactionQueueSchema: ", error)
            }
        }
        return []
    }
    
    func fetch(id: String) -> StockTransactionQueueSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.transactionQueueID == id }
                )
                return try context.fetch(descriptor).first
                
            }
            catch {
                debugPrint("Error Fetch StockTransactionQueueSchema: ", error)
            }
        }
        return nil
    }
    
    func fetchWith(userID: String) -> [StockTransactionQueueSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.userID == userID}
                )
                return try context.fetch(descriptor)
            }
            catch {
                debugPrint("Error Fetch StockTransactionQueueSchema: ", error)
            }
        }
        return []
    }
    
    func save(_ transaction: StockTransactionQueueSchema) throws {
        if let context = modelContext {
            let transactionID: String = transaction.transactionQueueID
            
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionQueueID == transactionID }
            )
            
            if try context.fetch(descriptor).first != nil {
                throw SwiftDataError.alreadyExists( transaction)
            }
            
            context.insert(transaction)
            try context.save()
        }
    }
    
    func delete(_ transactionID: String) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionQueueID == transactionID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound( transactionID)
            }
            
            context.delete(result)
            try context.save()
        }
    }
    
    
}
