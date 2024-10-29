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
    func save(investment: StockInvestmentSchema) throws
    func add(to investmentID: String, lot: Int) throws
    func add(to investmentID: String, totalInvested: Int) throws
    func substract(from investmentID: String, lot: Int) throws
    func substract(from investmentID: String, totalInvested: Int) throws
}
