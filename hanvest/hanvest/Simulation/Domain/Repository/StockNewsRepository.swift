//
//  StockNewsRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation

protocol StockNewsRepository {
    func fetch() -> [StockNewsSchema]
    func fetch(id: String) -> StockNewsSchema?
    func fetchRandom() -> StockNewsSchema?
    func save(_ news: StockNewsSchema) throws
    func delete(id: String) throws
    func update(id: String, stockIDName: String) throws
    func update(id: String, newsTitle: String) throws
    func update(id: String, newsContent: String) throws
    func update(id: String, stockFluksPercentage: Int) throws
}
