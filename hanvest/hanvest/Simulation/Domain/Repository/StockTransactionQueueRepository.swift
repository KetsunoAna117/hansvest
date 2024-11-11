//
//  StockTransactionQueueRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 05/11/24.
//

import Foundation

protocol StockTransactionQueueRepository {
    func fetch() -> [StockTransactionQueueSchema]
    func fetch(id: String) -> StockTransactionQueueSchema?
    func fetchWith(userID: String) -> [StockTransactionQueueSchema]
    func save(_ transaction: StockTransactionQueueSchema) throws
    func delete(_ transactionID: String) throws
}
