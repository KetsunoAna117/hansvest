//
//  GetStockNewsData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

protocol GetStockNewsData {
    func execute() -> [StockNewsEntity]
}

struct GetStockNewsDataImpl: GetStockNewsData {
    let newsRepo: SimulationNewsRepository
    
    func execute() -> [StockNewsEntity] {
        return newsRepo.fetch().map { $0.mapToEntity() }
    }
}
