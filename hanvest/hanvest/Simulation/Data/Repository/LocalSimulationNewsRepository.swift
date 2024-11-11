//
//  LocalSimulationNewsRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation
import SwiftData

struct LocalSimulationNewsRepository: StockNewsRepository {
    let modelContext: ModelContext?
    
    func fetch() -> [StockNewsSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockNewsSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch News Data with error: ",error)
            }
        }
        return []
    }
    
    func fetch(id: String) -> StockNewsSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<StockNewsSchema>(
                    predicate: #Predicate { $0.newsID == id}
                )
                let result = try context.fetch(descriptor)
                return result.first
            }
            catch {
                debugPrint("Error Fetch News Data by ID with error: ",error)
            }
        }
        return nil
    }
    
    func fetchRandom() -> StockNewsSchema? {
        if let context = modelContext {
            do {
                let countDescriptor = FetchDescriptor<StockNewsSchema>()
                let dataCount = try context.fetchCount(countDescriptor)
                
                guard dataCount > 0 else { return nil }
                
                let randomOffset = Int.random(in: 0..<dataCount)
                var newsDescriptor: FetchDescriptor<StockNewsSchema> {
                    var descriptor = FetchDescriptor<StockNewsSchema>()
                    descriptor.fetchLimit = 1
                    descriptor.fetchOffset = randomOffset
                    return descriptor
                }
                
                let result = try context.fetch(newsDescriptor)
                return result.first

            }
            catch {
                debugPrint("Error Fetch Random News Data: ", error)
            }
        }
        
        return nil
    }
    
    func save(_ news: StockNewsSchema) throws {
        if let context = modelContext {
            let fetchedNews = fetch(id: news.newsID)
            if fetchedNews != nil {
                throw SwiftDataError.alreadyExists(news)
            }
            
            context.insert(news)
            try context.save()
        }
    }
    
    func delete(id: String) throws {
        if let context = modelContext {
            let fetchedNews = fetch(id: id)
            if fetchedNews == nil {
                throw SwiftDataError.notFound()
            }
            
            context.delete(fetchedNews!)
            try context.save()
        }
    }
    
    func update(id: String, stockIDName: String) throws {
        if let context = modelContext {
            let fetchedNews = fetch(id: id)
            guard let fetchedNews else {
                throw SwiftDataError.notFound()
            }
            
            fetchedNews.update(stockIDName: stockIDName)
            try context.save()
        }
    }
    
    func update(id: String, newsTitle: String) throws {
        if let context = modelContext {
            let fetchedNews = fetch(id: id)
            guard let fetchedNews else {
                throw SwiftDataError.notFound()
            }
            
            fetchedNews.update(newsTitle: newsTitle)
            try context.save()
        }
    }
    
    func update(id: String, newsContent: String) throws {
        if let context = modelContext {
            let fetchedNews = fetch(id: id)
            guard let fetchedNews else {
                throw SwiftDataError.notFound()
            }
            
            fetchedNews.update(newsContent: newsContent)
            try context.save()
        }
    }
    
    func update(id: String, stockFluksPercentage: Int) throws {
        if let context = modelContext {
            let fetchedNews = fetch(id: id)
            guard let fetchedNews else {
                throw SwiftDataError.notFound()
            }
            
            fetchedNews.update(stockFluksPercentage: stockFluksPercentage)
            try context.save()
        }
    }
}
