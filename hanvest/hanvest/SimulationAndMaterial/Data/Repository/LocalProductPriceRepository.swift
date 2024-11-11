//
//  LocalProductPriceRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation
import SwiftData

struct LocalProductPriceRepository: ProductPriceRepository {
    let modelContext: ModelContext?
    
    func fetchAll() -> [ProductPriceSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<ProductPriceSchema>(
                    sortBy: [
                        .init(\.time)
                    ]
                )
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetch(priceID: String) -> ProductPriceSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<ProductPriceSchema>(
                    predicate: #Predicate{ $0.priceID == priceID },
                    sortBy: [
                        .init(\.time)
                    ]
                )
                let result = try context.fetch(descriptor)
                return result.first
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return nil
    }
    
    func fetchAllWith(stockID: String) -> [ProductPriceSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<ProductPriceSchema>(
                    predicate: #Predicate{ $0.name == stockID },
                    sortBy: [
                        .init(\.time)
                    ]
                )
                
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetchCount(stockID: String) -> Int {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<ProductPriceSchema>(
                    predicate: #Predicate{ $0.name == stockID }
                )
                
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        
        return 0
    }
    
    func save(_ productPrice: ProductPriceSchema) throws {
        if let context = modelContext {
            if fetch(priceID: productPrice.priceID) != nil {
                throw SwiftDataError.alreadyExists(productPrice)
            }
            
            context.insert(productPrice)
            try context.save()
        }
    }
    
    func delete(id: String) throws {
        if let context = modelContext {
            guard let fetchedProductPrice = fetch(priceID: id) else {
                throw SwiftDataError.notFound()
            }
            
            context.delete(fetchedProductPrice)
            try context.save()
        }
    }
    
    func update(id: String, priceID: String) throws {
        if let context = modelContext {
            guard let fetchedProductPrice = fetch(priceID: id) else {
                throw SwiftDataError.notFound()
            }
            
            fetchedProductPrice.update(priceID: priceID)
            try context.save()
        }
    }
    
    func update(id: String, name: String) throws {
        if let context = modelContext {
            guard let fetchedProductPrice = fetch(priceID: id) else {
                throw SwiftDataError.notFound()
            }
            
            fetchedProductPrice.update(name: name)
            try context.save()
        }
    }
    
    func update(id: String, price: Int) throws {
        if let context = modelContext {
            guard let fetchedProductPrice = fetch(priceID: id) else {
                throw SwiftDataError.notFound()
            }
            
            fetchedProductPrice.update(price: price)
            try context.save()
        }
    }
    
    func update(id: String, time: Date) throws {
        if let context = modelContext {
            guard let fetchedProductPrice = fetch(priceID: id) else {
                throw SwiftDataError.notFound()
            }
            
            fetchedProductPrice.update(time: time)
            try context.save()
        }
    }
    
    
}
