//
//  SimulationStockRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation

protocol StockRepository {
    func fetchAll() -> [StockSchema]
    func fetch(stockID: String) -> StockSchema?
    func save(_ stocks: StockSchema) throws
    func delete(id: String) throws
    func update(id: String, stockIDName: String) throws
    func update(id: String, stockName: String) throws
    func update(id: String, stockImageName: String) throws
    func update(id: String, stockDescription: String) throws
}
