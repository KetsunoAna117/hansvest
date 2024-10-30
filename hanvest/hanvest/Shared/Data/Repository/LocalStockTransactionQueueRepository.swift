//
//  LocalStockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
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
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetch(id: String) -> StockTransactionQueueSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.transactionID == id}
                )
                return try context.fetch(descriptor).first
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return nil
    }
    
    func fetchWith(stockIDName: String) -> [StockTransactionQueueSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.stockIDName == stockIDName}
                )
                return try context.fetch(descriptor)
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func save(_ transaction: StockTransactionQueueSchema) throws {
        if let context = modelContext {
            let transactionID: String = transaction.transactionID
            
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionID == transactionID }
            )
            
            if try context.fetch(descriptor).first != nil {
                throw SwiftDataError.alreadyExists
            }
            
            context.insert(transaction)
            try context.save()
        }
    }
    
    func delete(_ transactionID: String) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionID == transactionID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            context.delete(result)
            try context.save()
        }
    }



    
    func update(id: String, price: Int) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionID == id }
            )
            
            guard let transaction = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            transaction.update(newPriceAtUpdate: price)
            try context.save()
        }
    }
    
    func update(id: String, stockLotQty: Int) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionID == id }
            )
            
            guard let transaction = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            transaction.update(stockLotQuantity: stockLotQty)
            try context.save()
        }
    }
    
    func update(id: String, time: Date) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                predicate: #Predicate { $0.transactionID == id }
            )
            
            guard let transaction = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            transaction.update(time: time)
            try context.save()
        }
    }
    
    
}
