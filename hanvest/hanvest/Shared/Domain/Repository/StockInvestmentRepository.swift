//
//  StockTransactionRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation

protocol StockInvestmentRepository {
    func fetch() -> [StockInvestmentSchema]
    func fetchBy(investmentID: String) -> StockInvestmentSchema?
    func add(investment: StockInvestmentSchema) throws
    func substract(investment: StockInvestmentSchema) throws
}
