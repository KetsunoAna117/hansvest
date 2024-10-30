//
//  StockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

protocol StockTransactionQueueRepository {
    func fetch() -> [StockTransactionQueueSchema]
    func fetch(id: String) -> StockTransactionQueueSchema?
    func fetchWith(stockIDName: String) -> [StockTransactionQueueSchema]
    func save(_ transaction: StockTransactionQueueSchema) throws
    func delete(_ transactionID: String) throws
    func update(id: String, price: Int) throws
    func update(id: String, stockLotQty: Int) throws
    func update(id: String, time: Date) throws
}
