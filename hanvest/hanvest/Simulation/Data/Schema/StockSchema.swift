//
//  SimulationStockSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class StockSchema {
    @Attribute(.unique) var stockIDName: String
    var stockName: String
    var stockImageName: String
    var stockDescription: String
    
    init(stockIDName: String, stockName: String, stockImageName: String, stockDescription: String) {
        self.stockIDName = stockIDName
        self.stockName = stockName
        self.stockImageName = stockImageName
        self.stockDescription = stockDescription
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
    
    func mapToEntity(
        productPriceSchema: [ProductPriceSchema]
    ) -> StockEntity {
        return StockEntity(
            stockIDName: self.stockIDName,
            stockName: self.stockName,
            stockImageName: self.stockImageName,
            stockDescription: self.stockDescription,
            stockPrice: productPriceSchema.map({
                $0.mapToEntity()
            })
        )
    }
}
