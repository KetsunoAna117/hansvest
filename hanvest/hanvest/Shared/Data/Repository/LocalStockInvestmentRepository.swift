//
//  LocalStockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation
import SwiftData

struct LocalStockInvestmentRepository: StockInvestmentRepository {
    let modelContext: ModelContext?
    
    func fetch() -> [StockInvestmentSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>()
                return try context.fetch(descriptor)
            }
            catch {
                debugPrint("Error Fetch StockInvestmentSchema: ",error)
            }
        }
        return []
    }
    
    func fetchBy(investmentID: String) -> StockInvestmentSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>(
                    predicate: #Predicate{ $0.investmentID == investmentID }
                )
                return try context.fetch(descriptor).first
            }
            catch {
                debugPrint("Error Fetch StockInvestmentSchema: ",error)
            }
        }
        return nil
    }
    
    func add(investment: StockInvestmentSchema) throws {
        if let context = modelContext {
            let investmentID: String = investment.investmentID
            
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate { $0.investmentID == investmentID }
            )
            
            // Update and add new data if any
            if let stockInvestment = try context.fetch(descriptor).first {
                stockInvestment.add(data: investment)
            }
            // Save to SwiftData if not found
            else {
                context.insert(investment)
            }
            
            try context.save()
        }
    }
    
    func substract(investment: StockInvestmentSchema) throws {
        if let context = modelContext {
            let investmentID: String = investment.investmentID
            
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate { $0.investmentID == investmentID }
            )
            
            // Update and substract from new data if any
            if let stockInvestment = try context.fetch(descriptor).first {
                stockInvestment.substract(from: investment)
            }
            // Save to SwiftData if not found
            else {
                throw SwiftDataError.notFound
            }
            
            try context.save()
        }
    }
    
    
}
