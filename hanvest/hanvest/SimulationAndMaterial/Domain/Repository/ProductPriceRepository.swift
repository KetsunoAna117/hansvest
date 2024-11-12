//
//  ProductPriceRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation

protocol ProductPriceRepository {
    func fetchAll() -> [ProductPriceSchema]
    func fetch(priceID: String) -> ProductPriceSchema?
    func fetchAllWith(stockID: String) -> [ProductPriceSchema]
    func fetchCount(stockID: String) -> Int
    func save(_ productPrice: ProductPriceSchema) throws
    func delete(id: String) throws
    func update(id: String, priceID: String) throws
    func update(id: String, name: String) throws
    func update(id: String, price: Int) throws
    func update(id: String, time: Date) throws
}
