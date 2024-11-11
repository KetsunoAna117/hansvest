//
//  LocalSimulationStockRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation
import SwiftData

struct LocalSimulationStockRepository: StockRepository {
    let modelContext: ModelContext?
    
    func fetchAll() -> [StockSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        
        return []
    }
    
    func fetch(stockID id: String) -> StockSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockSchema>(
                    predicate: #Predicate { $0.stockIDName == id}
                )
                
                let result = try context.fetch(descriptor).first
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        
        return nil
    }
    
    func save(_ stocks: StockSchema) throws {
        if let context = modelContext {
            if fetch(stockID: stocks.stockIDName) != nil {
                throw SwiftDataError.alreadyExists(stocks)
            }
            
            context.insert(stocks)
            try context.save()
        }
    }
    
    func delete(id: String) throws {
        if let context = modelContext {
            guard let stock = fetch(stockID: id) else {
                throw SwiftDataError.notFound()
            }
            
            context.delete(stock)
            try context.save()
        }
    }
    
    func update(id: String, stockIDName: String) throws {
        if let context = modelContext {
            guard let stock = fetch(stockID: id) else {
                throw SwiftDataError.notFound()
            }
            
            stock.update(stockIDName: stockIDName)
            try context.save()
        }
    }
    
    func update(id: String, stockName: String) throws {
        if let context = modelContext {
            guard let stock = fetch(stockID: id) else {
                throw SwiftDataError.notFound()
            }
            
            stock.update(stockName: stockName)
            try context.save()
        }
    }
    
    func update(id: String, stockImageName: String) throws {
        if let context = modelContext {
            guard let stock = fetch(stockID: id) else {
                throw SwiftDataError.notFound()
            }
            
            stock.update(stockImageName: stockImageName)
            try context.save()
        }
    }
    
    func update(id: String, stockDescription: String) throws {
        if let context = modelContext {
            guard let stock = fetch(stockID: id) else {
                throw SwiftDataError.notFound()
            }
            
            stock.update(stockDescription: stockDescription)
            try context.save()
        }
    }
    
    
}
