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
    
    func fetchBy(userID: String) -> [StockInvestmentSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>(
                    predicate: #Predicate{ $0.userID == userID }
                )
                return try context.fetch(descriptor)
            }
            catch {
                debugPrint("Error Fetch StockInvestmentSchema: ",error)
            }
        }
        return []
    }
    
    func fetchBy(userID: String, stockIDName: String) -> StockInvestmentSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>(
                    predicate: #Predicate{ $0.userID == userID && $0.stockIDName == stockIDName }
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
            let investmentStock = investment.stockIDName
            
            let descriptor = FetchDescriptor<StockInvestmentSchema>(
                predicate: #Predicate { $0.stockIDName == investmentStock }
            )
            
            // Save if not found
            if try context.fetch(descriptor).count <= 0 {
                context.insert(investment)
            }
            else {
                throw SwiftDataError.alreadyExists( investment)
            }
            
            try context.save()
        }
    }
    
    func add(investmentID: String, totalInvested: Int, lotPurchased: Int) throws {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>(
                    predicate: #Predicate{ $0.investmentID == investmentID }
                )
                
                // Add investment data if found
                if let investment = try context.fetch(descriptor).first {
                    investment.add(totalInvested: totalInvested, lotPurchased: lotPurchased)
                    
                    try context.save()
                }
                else {
                    throw SwiftDataError.notFound( investmentID)
                }
            }
        }
    }
    
    func substract(investmentID: String, totalInvested: Int, lotPurchased: Int) throws {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>(
                    predicate: #Predicate{ $0.investmentID == investmentID }
                )
                
                // Add investment data if found
                if let investment = try context.fetch(descriptor).first {
                    investment.substract(totalInvested: totalInvested, lotPurchased: lotPurchased)
                    
                    try context.save()
                }
                else {
                    throw SwiftDataError.notFound( investmentID)
                }
            }
        }
    }
}
