//
//  GetAvailableSimulationStocks.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

protocol GetAvailableSimulationStocks {
    func execute() -> [SimulationStockEntity]
}

struct GetAvailableSimulationStocksImpl: GetAvailableSimulationStocks {
    let stockRepo: SimulationStockRepository
    let productPriceRepo: ProductPriceRepository
    
    func execute() -> [SimulationStockEntity] {
        let fetchedStock = stockRepo.fetchAll()
        
        return fetchedStock.map { stock in
            let fetchedPrice = productPriceRepo.fetchAllWith(stockID: stock.stockIDName)
            return stock.mapToEntity(productPriceSchema: fetchedPrice)
        }
    }
}
