//
//  LocalStockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

struct LocalStockTransactionRepository: StockTransactionRepository {
    let modelContext: ModelContext?
    
    func fetch() -> [StockTransactionSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionSchema>()
                return try context.fetch(descriptor)
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetch(id: String) -> StockTransactionSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionSchema>(
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
    
    func fetchWith(investmentID: String) -> [StockTransactionSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockTransactionSchema>(
                    predicate: #Predicate { $0.investmentID == investmentID}
                )
                return try context.fetch(descriptor)
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func save(_ transaction: StockTransactionSchema) throws {
        if let context = modelContext {
            let transactionID: String = transaction.transactionID
            
            let descriptor = FetchDescriptor<StockTransactionSchema>(
                predicate: #Predicate { $0.transactionID == transactionID }
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
            let descriptor = FetchDescriptor<StockTransactionSchema>(
                predicate: #Predicate { $0.transactionID == transactionID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound( transactionID)
            }
            
            context.delete(result)
            try context.save()
        }
    }
}
