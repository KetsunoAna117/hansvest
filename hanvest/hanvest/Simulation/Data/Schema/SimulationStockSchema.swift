//
//  SimulationStockSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class SimulationStockSchema {
    @Attribute(.unique) var stockIDName: String
    var stockName: String
    var stockImageName: String
    var stockDescription: String
    var stockPriceID: [String]
    
    init(stockIDName: String, stockName: String, stockImageName: String, stockDescription: String, stockPriceID: [String]) {
        self.stockIDName = stockIDName
        self.stockName = stockName
        self.stockImageName = stockImageName
        self.stockDescription = stockDescription
        self.stockPriceID = stockPriceID
    }
    
    func update(stockIDName: String) {
        self.stockIDName = stockIDName
    }
    
    func update(stockName: String) {
        self.stockName = stockName
    }
    
    func update(stockImageName: String) {
        self.stockImageName = stockImageName
    }
    
    func update(stockDescription: String) {
        self.stockDescription = stockDescription
    }
    
    func update(stockPriceID: [String]) {
        self.stockPriceID = stockPriceID
    }
    
    func mapToEntity(
        productPriceSchema: [ProductPriceSchema]
    ) -> SimulationStockEntity {
        return SimulationStockEntity(
            stockIDName: self.stockIDName,
            stockName: self.stockName,
            stockImageName: self.stockImageName,
            stockDescription: self.stockDescription,
            stockPrice: productPriceSchema.map({ $0.mapToEntity() }).sorted(by: {$0.time < $1.time})
        )
    }
}
