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
    
    func save(investment: StockInvestmentSchema) throws {
        if let context = modelContext {
            let investmentID: String = investment.investmentID
            
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate { $0.investmentID == investmentID }
            )
            
            // Update to new data if any
            if let stockInvestment = try context.fetch(descriptor).first {
                stockInvestment.update(newStockInvestmentSchema: investment)
            }
            // Save to SwiftData if not found
            else {
                context.insert(investment)
            }
            
            try context.save()
        }
    }
    
    func add(to investmentID: String, lot: Int) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate{ $0.investmentID == investmentID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            result.add(lotPurchased: lot)
            try context.save()
        }
    }
    
    func add(to investmentID: String, totalInvested: Int) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate{ $0.investmentID == investmentID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            result.add(totalInvested: totalInvested)
            try context.save()
        }
    }
    
    func substract(from investmentID: String, lot: Int) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate{ $0.investmentID == investmentID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            result.substract(lotPurchased: lot)
            try context.save()
        }
    }
    
    func substract(from investmentID: String, totalInvested: Int) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate{ $0.investmentID == investmentID }
            )
            
            guard let result = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound
            }
            
            result.substract(totalInvested: totalInvested)
            try context.save()
        }
    }
    
    
}
