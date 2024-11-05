//
//  StockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

protocol StockTransactionRepository {
    func fetch() -> [StockTransactionSchema]
    func fetch(id: String) -> StockTransactionSchema?
    func fetchWith(investmentID: String) -> [StockTransactionSchema]
    func save(_ transaction: StockTransactionSchema) throws
    func delete(_ transactionID: String) throws
}
