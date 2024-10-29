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
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>()
                
                if (try context.fetch(descriptor).first(where: {
                    $0.transactionID == transaction.transactionID
                })) != nil {
                    throw SwiftDataError.alreadyExists
                }
                
                context.insert(transaction)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func delete(_ transactionID: String) {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.transactionID == transactionID }
                )
                
                guard let result = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                context.delete(result)
                try? context.save()
            } catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }



    
    func update(id: String, price: Int) {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.transactionID == id }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                transaction.update(newPriceAtUpdate: price)
                try? context.save()
                
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    func update(id: String, stockLotQty: Int) {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.transactionID == id }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                transaction.update(stockLotQuantity: stockLotQty)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    func update(id: String, time: Date) {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionQueueSchema>(
                    predicate: #Predicate { $0.transactionID == id }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                transaction.update(time: time)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    
}
